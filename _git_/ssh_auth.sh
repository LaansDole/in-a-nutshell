#!/bin/bash

# Generate SSH key without prompting
ssh-keygen -R github.com
ssh-keygen -t ed25519 -C "dolelongan@gmail.com" -f ~/.ssh/id_ed25519 -N ""

# Fetch and add GitHub host key to known_hosts
ssh-keyscan github.com >> ~/.ssh/known_hosts

# Start the SSH agent
eval "$(ssh-agent -s)"

# Add SSH key to the agent
ssh-add ~/.ssh/id_ed25519

# Display the SSH public key
ssh_pub_key=$(cat ~/.ssh/id_ed25519.pub)
echo "SSH public key: $ssh_pub_key"

# Replace with your github username and github token
github_username="LaansDole"
github_token=""

# Add SSH key to GitHub using the API
curl -X POST -H "Authorization: token $github_token" -d "{\"title\":\"Git_SSH\",\"key\":\"$ssh_pub_key\"}" https://api.github.com/user/keys

echo "SSH key added to GitHub successfully."

# Initialize a Git repository
git init

# Check current remotes
git remote -v

# Add a new remote repository (if not already added)
git remote add origin git@github.com:LaansDole/
