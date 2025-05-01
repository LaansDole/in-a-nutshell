# Git Aliases

This page documents the Git aliases included in this repository's `.gitconfig` file.

## Basic Commands

| Alias | Command | Description |
|-------|---------|-------------|
| `st`  | `status -s` | Show short status |
| `cl`  | `clone` | Clone a repository |
| `ci`  | `commit` | Commit changes |
| `br`  | `branch` | List or manage branches |
| `sw`  | `switch` | Switch branches |
| `swb` | `checkout -` | Switch to previous branch |
| `r`   | `reset` | Reset changes |
| `pu`  | `pull` | Pull changes |

## Commit Commands

| Alias | Command | Description |
|-------|---------|-------------|
| `aa`  | `add .` | Add all changes |
| `amend` | `commit --amend` | Amend last commit |
| `amend-rb` | `rebase -i` | Interactive rebase for amending commits |
| `amend-HEAD` | `commit -a --amend -C HEAD` | Amend with previous commit message |
| `p` | `push` | Push changes |
| `puf` | `push --force-with-lease` | Force push with lease |

## Diff Commands

| Alias | Command | Description |
|-------|---------|-------------|
| `d` | `diff --word-diff` | Show word-level diff |
| `dc` | `diff --cached` | Show diff of staged changes |
| `dlc` | `diff --cached HEAD^` | Diff last commit |
| `diffst` | `diff --name-only` | Show only modified file names |

## Reset Commands

| Alias | Command | Description |
|-------|---------|-------------|
| `r1` | `reset HEAD^` | Reset to previous commit |
| `r2` | `reset HEAD^^` | Reset to two commits back |
| `rh` | `reset --hard` | Hard reset |
| `rh1` | `reset HEAD^ --hard` | Hard reset to previous commit |
| `rh2` | `reset HEAD^^ --hard` | Hard reset to two commits back |

## Branch Management

| Alias | Command | Description |
|-------|---------|-------------|
| `brdhere` | Custom script | Delete branches merged to current branch |
| `sweep` | Custom script | Delete tracking branches no longer on remote |
| `cleanup` | `sweep && brdhere` | Run both cleanup commands |
| `rem` | Custom script | List remotes |
| `wl` | `worktree list` | List worktrees |
| `hist` | Custom log format | Show formatted history with branching |
| `labr` | `branch -a` | List all branches |
| `sync-up` | Custom script | Sync branch with remote |
| `rename-branch` | Custom function | Rename a branch |
