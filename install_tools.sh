#!/bin/bash

# Title: Minimal macOS Desktop Installer
# Description: This script installs all the necessary tools to replicate the
# minimal desktop environment from the Dave2D YouTube video.

# --- Function to print styled headers ---
print_header() {
    echo " "
    echo "================================================="
    echo "    $1"
    echo "================================================="
    echo " "
}

# --- 1. Install Homebrew (if not installed) ---
print_header "Checking for Homebrew..."
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# --- 2. Install the Font ---
print_header "Installing JetBrains Mono Nerd Font..."
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font

# --- 3. Install Core Applications & Utilities ---
print_header "Installing Applications & CLI Tools..."

# List of packages to install
packages=(
    "ghostty"       # The terminal emulator
    "yazi"          # The file manager
    "btop"          # The resource monitor
    "fastfetch"     # The system information tool
    "kew"           # The music player
    "aichat"        # The AI chat client
    "circumflex"    # Hacker News in the terminal
    "mpv"           # The media player
)

# Loop through and install each package
for package in "${packages[@]}"; do
    if brew list "$package" &> /dev/null; then
        echo "$package is already installed. Skipping."
    else
        echo "Installing $package..."
        brew install "$package"
    fi
done

print_header "Installation Complete!"
echo "All tools for your minimal desktop have been installed."
echo "You can now configure Ghostty and your other tools."

curl wttr.in/12.9554,77.7086 # Gandhinagar munnekollal, bengaluru

