# Setting Up Your WSL Environment

This guide walks you through the process of setting up your WSL (Windows Subsystem for Linux) environment using the `dotfiles` repository.

## Prerequisites

- A plain Debian installation on WSL.
- Internet connection to download necessary packages and clone the repository.

## Installation Steps

### 1. Install Git

Git is required to clone the repository. Open your WSL terminal and execute the following commands:
- Open your WSL terminal.
- Since this is a plain Debian installation, first update your package list and then install git. Run the following commands:
```bash
sudo apt update
```
- Install git
```bash
sudo apt install git -y
```

### 2. **Clone the Repository**:
- Clone the repository from GitHub by running:
```bash
git clone https://github.com/FriedrichGrey/.dotfiles.git
```
- This clones the repository into a `dotfiles` directory in your current working directory.

### 3. **Navigate to the Repository Directory**:
- Change your current directory to the `dotfiles` directory:
```bash
cd .dotfiles
```

### 4. **Make the Script Executable** (if not already):
- Before executing `startup.sh`, make sure it has execute permissions:
```bash
chmod +x startup.sh
```

### 5. **Execute the `startup.sh` Script**:
- Run the script with the following command:
```bash
./startup.sh
```

### 6. **Follow Any On-Screen Instructions**:
- If the script has prompts or requires user input, follow the on-screen instructions.