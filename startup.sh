#!/bin/bash

# Update
echo -e "\033[1;34mUpdating and upgrading system...\033[0m"
sudo apt update && apt upgrade
echo -e "\033[1;34m...Done!\033[0m"

# Install
echo -e "\033[1;34mInstalling essentials...\033[0m"
sudo apt install -y git nvim curl build-essential libc-dev cmake fzf
echo -e "\033[1;34m...Done!\033[0m"

# Shell
echo -e "\033[1;34mShell config...\033[0m"
sudo apt install -y zsh starship
chsh -s $(which zsh)
echo -e "\033[1;34m...Done!\033[0m"

# Additional software installations
# sudo apt-get install -y <other-packages>

# Configuration commands
# git config --global user.name "Your Name"
# git config --global user.email "your.email@example.com"

# Any other setup or configuration commands
