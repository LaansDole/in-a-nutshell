## Pre-requisite

You should have the oh-my-zsh installed. Then, in the terminal configuration, use the Hack-Font that you have downloaded from this repo 
***Refer to [Powerlevel10k Documentation](https://github.com/romkatv/powerlevel10k#getting-started) for more information***

## Usage

- To see all zsh aliases, run `help-shell` on terminal
- To see all git aliases, run `help-git` on terminal

## Utility Scripts

This directory contains several utility scripts to help set up and manage your shell environment:

### omz-init.sh
Sets up Oh My Zsh with Powerlevel10k and necessary dependencies.

```bash
# Install Oh My Zsh and dependencies
./omz-init.sh
```

### sync-zsh-alias.sh
Keeps your zsh aliases in sync by copying them from `.zsh-alias.sh` to your `.zshrc` file.

```bash
# Sync your aliases
./sync-zsh-alias.sh
```

## Bug Fixes

### On macOS and other UNIX system

This is the instruction if you are running into the permission error when running `npm`, it is recommended that you re-install `node` with `nvm` first:
1. Run the command to export the `$PATH` of `npm` to your local environment:
```bash
nano ~/.bash_profile
```
Add below lines to the `.bash_profile` file:
```bash
export PATH="$HOME/.npm-packages/bin:$PATH"
``` 
2. Save the file and re-check:
```bash
cat .bash_profile
```
3. [OPTIONAL] Add below line to both `.bash_profile` and `.bashrc` (or `.zshrc`):
```bash
export NVM_DIR=~/.nvm
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
```
4. Reset the local environment to update the changes:
```bash
source ~/.bash_profile
source ~/.bashrc
source ~/.zshrc
```
5. [OPTIONAL] Restart your machine
## Clean Installation for `node` and `npm`

This guide provides steps to uninstall Node.js and npm from your WSL Ubuntu and Windows system.

- ***Uninstalling from WSL Ubuntu***

1. Remove the installed Node.js package:
```bash
sudo apt-get remove nodejs
```
2. Remove the installed npm package:
```bash
sudo apt-get remove npm
```
3. Remove Node.js directories. These directories may contain npm packages installed globally on your system. You can remove them using the following commands:
```bash
sudo rm -rf /usr/local/lib/nodejs
sudo rm -rf ~/.npm
```
4. Check if Node.js and npm are uninstalled. You can do this by running the following commands:
```bash
node -v
npm -v
```
*If Node.js and npm are successfully uninstalled, these commands should not return any version number.*

If Node.js and npm are still present on your system, it's possible that they were installed in a different location that's still in your system's PATH. You can check where npm is installed by using the `which` command:
  ```bash
  which npm
  ```
This will return the path where npm is currently installed. You can then remove the npm and Node.js binaries from that location. Please be careful while doing this and ensure that you are removing the correct files.

Also, remember to close and reopen your terminal or run `source ~/.bashrc` to make sure your changes are being recognized.

- ***Uninstalling from Windows System***

If Node.js and npm are installed in your Windows system, you can uninstall them from the Windows "Add or Remove Programs" settings:

1. Open the Start Menu and search for "Add or Remove Programs".
2. In the list of installed programs, look for Node.js and click on it.
3. Click on the "Uninstall" button that appears.

Please note that this will only uninstall Node.js and npm from your Windows system. If you have Node.js and npm installed in other environments (like WSL), those installations will not be affected. Also, remember to backup any important data before uninstalling.

### Installing Node.js and npm using nvm

This guide provides steps to install Node.js and npm in your system using the Node Version Manager (nvm).

#### Installation Steps
Replace `zsh` with `bash` if you don't have OhMyZsh on your WSL2, however, it is highly recommended to do so!
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh
source ~/.zshrc
nvm install node
```
1. **Download and install nvm**:
    ```bash
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh
    ```
    This command downloads the nvm install script from the project's GitHub page and executes it. The `v0.38.0` in the URL should be replaced with the latest version of nvm, which can be found on the nvm GitHub page.

2. **Activate nvm**:
    ```bash
    source ~/.zshrc
    ```
    This command activates nvm by loading the nvm script into your current shell session. You need to run this command in any new shell session before you can use nvm.

3. **Install Node.js and npm**:
    ```bash
    nvm install node
    ```
    This command installs the latest version of Node.js and npm. If you want to install a specific version of Node.js, you can replace `node` with the version number. For example, `nvm install 14.15.1` would install Node.js version 14.15.1 and the corresponding npm version.

After following these steps, you can verify the installation by checking the versions of Node.js and npm:

```bash
node -v
npm -v

