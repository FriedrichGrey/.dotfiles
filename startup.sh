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
sudo apt install -y zsh starship
chsh -s $(which zsh)
echo -e "\033[1;34m...Done!\033[0m"

# Symlink
    # Function to create symbolic links
link_file() {
    local SRC="$1"
    local DEST="$2"

    # Create directory if it doesn't exist
    mkdir -p "$(dirname "$DEST")"

    # Create symbolic link
    ln -sfn "$SRC" "$DEST"
}

    # Base directory for dotfiles
DOTFILES_DIR="$HOME/.dotfiles"
    # Creating Syminks
link_file "$DOTFILES_DIR/.aws/config" "$HOME/.aws/config"
link_file "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
link_file "$DOTFILES_DIR/.config/starship" "$HOME/.config/starship"
link_file "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/.ssh/config" "$HOME/.ssh/config"
link_file "$DOTFILES_DIR/.zsh" "$HOME/.zsh"
link_file "$DOTFILES_DIR/.zshenv" "$HOME/.zshenv"
link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

echo "Dotfiles have been linked."