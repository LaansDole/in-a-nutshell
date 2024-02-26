#!/bin/bash

echo "Updating system packages..."
sudo apt-get update

echo "Installing Firefox..."
sudo apt-get install firefox

echo "Installing required libraries..."
sudo apt-get install libxcb-xkb1 libxkbcommon-x11-0 aptitude

echo "Fixing missing dependencies..."
sudo apt --fix-missing install

echo "Fixing broken dependencies..."
sudo apt --fix-broken install

echo "Cleaning up..."
sudo apt-get clean

echo "Installing Warp Terminal..."
sudo dpkg -i warp-terminal_0.2024.02.20.08.01.stable.02_amd64.deb
sudo apt install ./warp-terminal_0.2024.02.20.08.01.stable.02_amd64.deb

echo "Reinstalling xdg-utils..."
sudo apt-get install --reinstall xdg-utils

echo "Launching Warp Terminal..."
warp-terminal
