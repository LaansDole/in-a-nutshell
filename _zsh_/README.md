## Pre-requisite
You should have the oh-my-zsh installed. Then, in the terminal configuration, use the Hack-Font that you have downloaded from this repo 

## Usage

- To see all aliases, run `help-shell` on terminal
- ***Alternatively:*** You can run `helpme` on terminal to see all the options available for aliases

## Plugins

- For poetry enable tab completion:
```zsh
mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
```
