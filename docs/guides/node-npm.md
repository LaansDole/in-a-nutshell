# Node.js & npm Installation Guide

This guide provides steps for clean installation of Node.js and npm on different operating systems.

## Uninstalling Existing Installations

### WSL Ubuntu

1. Remove the installed Node.js package:
```bash
sudo apt-get remove nodejs
```

2. Remove the installed npm package:
```bash
sudo apt-get remove npm
```

3. Remove Node.js directories:
```bash
sudo rm -rf /usr/local/lib/nodejs
sudo rm -rf ~/.npm
```

4. Check if Node.js and npm are uninstalled:
```bash
node -v
npm -v
```

5. If Node.js is still present, find and remove it:
```bash
which npm
```

### Windows System

1. Open the Start Menu and search for "Add or Remove Programs"
2. Find Node.js in the list and click on it
3. Click on the "Uninstall" button

## Installing Node.js and npm using nvm

This is the recommended approach for all platforms:

1. Install nvm:
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh
```

2. Activate nvm:
```bash
source ~/.zshrc
```

3. Install Node.js and npm:
```bash
nvm install node
```

4. Verify the installation:
```bash
node -v
npm -v
```

## Fixing Permission Issues on macOS

If you encounter permission errors when running `npm`:

1. Add npm directory to PATH:
```bash
nano ~/.bash_profile
```

2. Add this line:
```bash
export PATH="$HOME/.npm-packages/bin:$PATH"
```

3. Save the file and verify:
```bash
cat .bash_profile
```

4. Optional: Add nvm configuration:
```bash
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
```

5. Update your environment:
```bash
source ~/.bash_profile
source ~/.bashrc
source ~/.zshrc
```
