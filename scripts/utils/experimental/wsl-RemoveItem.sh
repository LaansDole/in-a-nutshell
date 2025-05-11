#!/bin/bash
# filepath: wsl-remove.sh

# Script to call the Windows Smart-RemoveItem.ps1 script
# Usage: ./wsl-remove.sh <Recycle|Permanent> <path_to_wsl_file_or_folder>

_wsl_remove_function() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: $(basename "$0") <Recycle|Permanent> <path_to_wsl_file_or_folder>"
        echo ""
        echo "Modes:"
        echo "  Recycle    - Move the file/folder to Windows Recycle Bin (recoverable)"
        echo "  Permanent  - Delete the file/folder permanently (with size reporting)"
        echo ""
        echo "Examples:"
        echo "  $(basename "$0") Recycle ~/documents/old-file.txt"
        echo "  $(basename "$0") Permanent ~/temp/unwanted-folder"
        return 1
    fi

    local mode="$1"
    local wsl_path="$2"
    # IMPORTANT: Adjust this path to where your .ps1 script is on Windows
    local win_script_path="C:\\Users\\$USERNAME\\Smart-RemoveItem.ps1" 

    if [[ "$mode" != "Recycle" && "$mode" != "Permanent" ]]; then
        echo "Error: Invalid mode '$mode'. Must be 'Recycle' or 'Permanent'."
        return 1
    fi

    if [ ! -e "$wsl_path" ]; then
        echo "Error: WSL path '$wsl_path' does not exist."
        return 1
    fi

    local directory_to_monitor_wsl=""
    local original_wsl_path_is_dir=false

    if [ -d "$wsl_path" ]; then
        directory_to_monitor_wsl="$wsl_path"
        original_wsl_path_is_dir=true
    elif [ -f "$wsl_path" ]; then
        directory_to_monitor_wsl=$(dirname "$wsl_path")
    else
        echo "Warning: WSL path '$wsl_path' is neither a file nor a directory. Cannot monitor size."
    fi

    if [ "$mode" == "Permanent" ] && [ -n "$directory_to_monitor_wsl" ] && [ -e "$directory_to_monitor_wsl" ]; then
        echo "--- WSL Directory Size (using du) ---"
        local size_before_wsl_h=$(du -sh "$directory_to_monitor_wsl" | cut -f1)
        local size_before_wsl_b=$(du -sb "$directory_to_monitor_wsl" | cut -f1)
        echo "Size of '$directory_to_monitor_wsl' BEFORE deletion (WSL): $size_before_wsl_h ($size_before_wsl_b bytes)"
        echo "---------------------------------------"
    fi

    local win_path
    win_path=$(wslpath -w "$wsl_path")

    if [ -z "$win_path" ]; then
        echo "Error: Could not convert WSL path '$wsl_path' to a Windows path."
        return 1
    fi

    echo "Executing Windows script: $win_script_path -Path '$win_path' -Mode '$mode'"
    powershell.exe -NoProfile -NonInteractive -Command "& '$win_script_path' -Path '$win_path' -Mode '$mode'"
    # Using -Command "& 'script path'" for paths with spaces, though win_script_path here doesn't have them.
    # -File is generally preferred if the script path itself doesn't need complex quoting for PS.
    # For simplicity and consistency with previous examples, let's assume -File works if win_script_path is simple.
    # powershell.exe -NoProfile -NonInteractive -File "$win_script_path" -Path "$win_path" -Mode "$mode"
    
    local ps_exit_code=$?

    if [ "$mode" == "Permanent" ] && [ -n "$directory_to_monitor_wsl" ]; then
        echo "--- WSL Directory Size (using du) ---"
        if [ "$original_wsl_path_is_dir" = true ] && [ ! -e "$directory_to_monitor_wsl" ]; then
            # The directory itself was deleted
            echo "Size of '$wsl_path' AFTER deletion (WSL): 0 bytes (Directory deleted)"
        elif [ -e "$directory_to_monitor_wsl" ]; then
            # Parent directory or directory still exists (e.g. file deleted from it, or delete failed)
            local size_after_wsl_h=$(du -sh "$directory_to_monitor_wsl" | cut -f1)
            local size_after_wsl_b=$(du -sb "$directory_to_monitor_wsl" | cut -f1)
            echo "Size of '$directory_to_monitor_wsl' AFTER deletion (WSL): $size_after_wsl_h ($size_after_wsl_b bytes)"
        else
            echo "Directory '$directory_to_monitor_wsl' no longer exists or is inaccessible after operation."
        fi
        echo "---------------------------------------"
    fi
    
    if [ $ps_exit_code -ne 0 ]; then
        echo "Warning: PowerShell script exited with code $ps_exit_code."
    fi
    return $ps_exit_code
}

# Call the function with the arguments passed to the script
_wsl_remove_function "$@"