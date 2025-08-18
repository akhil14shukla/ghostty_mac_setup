#!/bin/zsh

# ==============================================================================
# macOS Keyboard-Driven Environment Setup Script
# ==============================================================================
# This script automates the setup for a minimal, keyboard-driven desktop
# environment on macOS using Ghostty.
#
# It will:
# 1. Create the configuration directory for Ghostty.
# 2. Write the Ghostty configuration file with the Catppuccin Mocha theme.
# 3. Add osascript aliases to your ~/.zshrc file for controlling Ghostty splits.
#
# IMPORTANT: This script assumes you have already installed:
# - Ghostty
# - JetBrains Mono Nerd Font
# ==============================================================================

# --- Step 1: Create Configuration Directory ---
echo "-> Creating Ghostty configuration directory..."
mkdir -p ~/.config/ghostty
echo "   Done."
echo

# --- Step 2: Create Ghostty Configuration File ---
echo "-> Writing Ghostty configuration file to ~/.config/ghostty/config..."
cat <<EOF > ~/.config/ghostty/config
# ==================================================
# Ghostty Configuration
# ==================================================

# --- Theme: Catppuccin Mocha ---
# Using the specified color palette for a cohesive look.
palette = 0=#45475a  # Surface2
palette = 1=#f38ba8  # Red
palette = 2=#a6e3a1  # Green
palette = 3=#f9e2af  # Yellow
palette = 4=#89b4fa  # Blue
palette = 5=#f5c2e7  # Pink
palette = 6=#94e2d5  # Teal
palette = 7=#bac2de  # Subtext1
palette = 8=#585b70  # Surface1
palette = 9=#f38ba8  # Red
palette = 10=#a6e3a1 # Green
palette = 11=#f9e2af # Yellow
palette = 12=#89b4fa # Blue
palette = 13=#f5c2e7 # Pink
palette = 14=#94e2d5 # Teal
palette = 15=#a6adc8 # Subtext0

background = #1e1e2e # Base
foreground = #cdd6f4 # Text
cursor-color = #f5e0dc # Rosewater

# --- Font Configuration ---
# Set to JetBrains Mono Nerd Font for ligatures and icons.
font "JetBrainsMono Nerd Font" size 14

# --- Window Appearance Settings ---
# These settings provide a clean, simple window appearance.
# Disabling the blur can improve performance and clarity.
macos-window-background-blur = "None"
# Ensuring the window is resizable is good practice.
macos-window-resizable = true

# Note: Default keybindings are used for splitting panes (Cmd+D, Cmd+Shift+D)
# and new tabs (Cmd+T). The osascript aliases below rely on these defaults.
EOF
echo "   Done."
echo

# --- Step 3: Add Control Aliases to ~/.zshrc ---
echo "-> Appending Ghostty control aliases to ~/.zshrc..."
cat <<'EOF' >> ~/.zshrc

# --- Ghostty Control Aliases ---
# Use osascript to simulate keystrokes for splitting panes and creating tabs.
alias split-right="osascript -e 'tell application \"System Events\" to keystroke \"d\" using command down'"
alias split-down="osascript -e 'tell application \"System Events\" to keystroke \"d\" using {command down, shift down}'"
alias new-tab="osascript -e 'tell application \"System Events\" to keystroke \"t\" using command down'"
EOF
echo "   Done."
echo

# --- Final Instructions ---
echo "=============================================================================="
echo "✅ Setup Complete!"
echo
echo "What's next?"
echo "1. Restart Ghostty for the new configuration to take effect."
echo "2. Restart your shell or run 'source ~/.zshrc' to activate the new aliases:"
echo "   - split-right"
echo "   - split-down"
echo "   - new-tab"
echo "=============================================================================="

