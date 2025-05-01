#!/bin/bash
set -euo pipefail

# Color definitions
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}Setting up MkDocs documentation system...${NC}"

# Check if pip is installed
if ! command -v pip &> /dev/null; then
    echo -e "${YELLOW}pip not found. Installing pip...${NC}"
    sudo apt-get update
    sudo apt-get install -y python3-pip
fi

# Install MkDocs and required packages
echo -e "${BLUE}Installing MkDocs and required packages...${NC}"
pip install mkdocs mkdocs-material mkdocs-minify-plugin

# Check if installation was successful
if command -v mkdocs &> /dev/null; then
    echo -e "${GREEN}MkDocs installed successfully!${NC}"
else
    echo -e "${YELLOW}MkDocs installation failed. Please check the error messages above.${NC}"
    exit 1
fi

# Display usage information
echo -e "\n${BLUE}Documentation setup complete!${NC}"
echo -e "\nTo ${GREEN}serve${NC} the documentation locally:"
echo -e "  ${YELLOW}mkdocs serve${NC}"
echo -e "\nTo ${GREEN}build${NC} the documentation site:"
echo -e "  ${YELLOW}mkdocs build${NC}"
echo -e "\nYour documentation will be available at ${BLUE}http://127.0.0.1:8000${NC} when serving."

# Make the script executable
chmod +x "$0"
