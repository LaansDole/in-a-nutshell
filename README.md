# Welcome to my in a nut.sh journey

To list only hidden files on a Mac, you can use the `ls` command with the `-ld` option followed by `.*`. Here's the command:

```bash
ls -ld .*
```

This command will list all files in the current directory that start with a dot (`.`), which is the convention for hidden files on Unix-like systems, including macOS. The `-l` option tells `ls` to use a long listing format, and the `-d` option tells it to treat directories themselves, rather than their contents. So, this command will give you a detailed listing of all hidden files and directories in the current directory. Please note that this command should be run in the terminal.
