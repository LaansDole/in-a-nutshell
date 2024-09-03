#!/bin/bash

# Function to display the help manual
function show_help() {
    echo "Usage: $(basename "$0") [options]"
    echo ""
    echo "Options:"
    echo "  -h, --help      Show this help message and return."
    echo ""
    echo "Description:"
    echo "  This script allows you to stage files using a fuzzy finder (fzf) for faster interaction."
    echo "  If fzf is not installed, it falls back to manual file selection."
    echo ""
    echo "Note: fzf is a command-line fuzzy finder written in Golang."
    echo ""
    echo "User Manual:"
    echo "  - Use ARROW KEYS (UP/DOWN) to move."
    echo "  - TAB to select files."
    echo "  - ENTER once you have done selecting the files you want to add."
}

# Check for help flag
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help
    return 0
fi

# Check if fzf is installed
if ! command -v fzf &> /dev/null; then
    echo "fzf is not installed. Proceeding without fzf. Please manually enter the files you want to stage."
    echo "Enter file names (separated by space):"
    read -r selected_files
else
    # Use git status to include both tracked and untracked files, and fzf for selection
    selected_files=$(git status --short | fzf --multi --preview "echo 'Use ARROW KEYS (UP/DOWN) to move, TAB to select files, ENTER when done.\n' && git diff --color=always -- {-1}" --preview-window=right:60%:wrap)
fi

# Check if any files were selected
if [[ -z "$selected_files" ]]; then
    echo "No files selected."
    return 0
fi

# Extract the file paths from the selected output and stage them
files_to_add=$(echo "$selected_files" | awk '{print $2}')

# Add the files to the staging area
echo "$files_to_add" | xargs git add

# Confirmation message
echo "The following files have been staged:"
echo "$files_to_add"