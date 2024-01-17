#!/bin/bash

# Update
echo -e "\033[1;34mUpdating and upgrading system...\033[0m"
sudo apt update && apt sudo upgrade -y
echo -e "\033[1;34m...Done!\033[0m"


# Install
echo -e "\033[1;34mInstalling essentials...\033[0m"
sudo apt install -y neovim curl build-essential libc-dev cmake fzf ripgrep
echo -e "\033[1;34m...Done!\033[0m"


# Docker
echo -e "\033[1;34mDocerconfig...\033[0m"
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt remove $pkg; done
    # Add Docker's official GPG key:
sudo apt update
sudo apt install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

    # Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
    # Install Docler packages
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


# Shell
echo -e "\033[1;34mShell config...\033[0m"
sudo apt install -y zsh
curl -sS https://starship.rs/install.sh | sh
mkdir -p ~/.config/starship
starship preset gruvbox-rainbow -o ~/.config/starship/starship.toml
chsh -s $(which zsh)
echo -e "\033[1;34m...Done!\033[0m"

# Symlink
    # Check for and create parent directories if they do not exist
mkdir -p ~/.aws
mkdir -p ~/.config/nvim
mkdir -p ~/.ssh
mkdir -p ~/.zsh

    # Create symbolic links
ln -s ~/.dotfiles/.aws/config ~/.aws/config
ln -s ~/.dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/.dotfiles/.config/starship/starship.toml ~/.config/starship/starship.toml
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.ssh/config ~/.ssh/config
ln -s ~/.dotfiles/.zsh/aliases.zsh ~/.zsh/aliases.zsh
ln -s ~/.dotfiles/.zsh/functions.zsh ~/.zsh/functions.zsh
ln -s ~/.dotfiles/.zsh/keybinds.zsh ~/.zsh/keybinds.zsh
ln -s ~/.dotfiles/.zsh/starship.zsh ~/.zsh/starship.zsh
ln -s ~/.dotfiles/.zsh/wsl2fix.zsh ~/.zsh/wsl2fix.zsh
ln -s ~/.dotfiles/.zshenv ~/.zshenv
ln -s ~/.dotfiles/.zshrc ~/.zshrc
