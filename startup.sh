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
curl -sS https://starship.rs/install.sh | sh -y
chsh -s $(which zsh)
echo -e "\033[1;34m...Done!\033[0m"

# Symlink
DOTFILES_DIR="$HOME/.dotfiles"
    # Check for and create parent directories if they do not exist
mkdir -p ~/.aws
mkdir -p ~/.config/nvim
mkdir -p ~/.config/starship
mkdir -p ~/.ssh
mkdir -p ~/.zsh

    # Create symbolic links
ln -s $DOTFILES_DIR/.aws/config ~/.aws/config
ln -s $DOTFILES_DIR/.config/nvim/init.lua ~/.config/nvim/init.lua
ln -s $DOTFILES_DIR/.config/starship/starship.toml ~/.config/starship/starship.toml
ln -s $DOTFILES_DIR/.gitconfig ~/.gitconfig
ln -s $DOTFILES_DIR/.ssh/config ~/.ssh/config
ln -s $DOTFILES_DIR/.zsh/aliases.zsh ~/.zsh/aliases.zsh
ln -s $DOTFILES_DIR/.zsh/functions.zsh ~/.zsh/functions.zsh
ln -s $DOTFILES_DIR/.zsh/keybinds.zsh ~/.zsh/keybinds.zsh
ln -s $DOTFILES_DIR/.zsh/starship.zsh ~/.zsh/starship.zsh
ln -s $DOTFILES_DIR/.zsh/wsl2fix.zsh ~/.zsh/wsl2fix.zsh
ln -s $DOTFILES_DIR/.zshenv ~/.zshenv
ln -s $DOTFILES_DIR/.zshrc ~/.zshrc
ln -s $DOTFILES_DIR/startup.sh ~/startup.sh
