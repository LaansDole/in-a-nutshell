# Utility Scripts

This section covers utility scripts included in this repository.

## fzadd.sh

The `fzadd.sh` script provides a fuzzy finder interface for Git staging operations.

[View Script Source](https://github.com/LaansDole/in-a-nutshell/blob/main/scripts/utils/fzadd.sh)

### Usage

```bash
./scripts/utils/fzadd.sh
```

### Features

- Interactive selection of files to stage using fuzzy finder (fzf)
- Fallback to manual selection if fzf is not available
- Preview of diffs for each file
- Multi-select functionality

### Options

- `-h` or `--help`: Show the help message
