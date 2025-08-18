#!/bin/zsh

# ==============================================================================
# Ghostty Dashboard Layout Script
# ==============================================================================
# This script automates the creation of a multi-pane dashboard layout in Ghostty,
# replicating the setup seen in the YouTube video. It sends a sequence of
# commands and simulated keystrokes to the active Ghostty window.
#
# USAGE:
# 1. Open a new, clean tab in Ghostty.
# 2. Run this script (`./launch_dashboard.sh`).
#
# It will create the following layout:
# +----------------------+----------------------+
# |                      | btop                 |
# |                      +----------------------+
# | yazi (File Manager)  | circumflex (News)    |
# |                      +----------------------+
# |                      | fastfetch (Sys Info) |
# +----------------------+----------------------+
#
# IMPORTANT: This script relies on the default Ghostty keybindings:
# - Vertical Split:   Cmd + D
# - Horizontal Split: Cmd + Shift + D
# - Navigate Panes:   Cmd + Option + Arrow Keys
# ==============================================================================

# --- Helper Functions to Interact with Ghostty ---

# Function to simulate typing a string and pressing the Enter key.
# Takes one argument: the command string to type.
type_command() {
  # Check if an argument was provided
  if [ -z "$1" ]; then
    echo "Error: type_command requires an argument."
    return 1
  fi
  # Use osascript to simulate typing the command string
  osascript -e "tell application \"System Events\" to keystroke \"$1\""
  # A tiny delay to ensure the keystrokes are registered before hitting enter
  sleep 0.1
  # Simulate pressing the Enter key
  osascript -e 'tell application "System Events" to keystroke return'
}

# Function to simulate a keystroke with the Command key held down.
# Takes one argument: the key to press (e.g., "d").
keystroke_cmd() {
  osascript -e "tell application \"System Events\" to keystroke \"$1\" using command down"
}

# Function to simulate a keystroke with Command and Shift keys held down.
# Takes one argument: the key to press (e.g., "d").
keystroke_cmd_shift() {
  osascript -e "tell application \"System Events\" to keystroke \"$1\" using {command down, shift down}"
}

# Function to simulate a keystroke with Command and Option keys held down.
# Used for navigating between panes.
# Takes one argument: an arrow key direction (e.g., "left").
keystroke_cmd_opt() {
    osascript -e "tell application \"System Events\" to key code {123} using {command down, option down}" # 123 is left arrow
}


# --- Main Execution Logic ---

echo "-> Setting up Ghostty dashboard layout..."

# Add a small initial delay to ensure Ghostty is ready
sleep 0.5

# Step 1: In the first (full-size) pane, clear it and run yazi.
echo "   - Starting yazi in the main pane..."
type_command "clear && yazi"
sleep 0.5 # Wait for yazi to launch

# Step 2: Create a vertical split to the right. The focus automatically moves to the new pane.
echo "   - Splitting window vertically..."
keystroke_cmd "d"
sleep 0.5

# Step 3: In the new right-hand pane, run btop.
echo "   - Starting btop in the top-right pane..."
type_command "btop"
sleep 0.5

# Step 4: Create a horizontal split below the btop pane. Focus moves to the new bottom pane.
echo "   - Splitting pane horizontally..."
keystroke_cmd_shift "d"
sleep 0.5

# Step 5: In the new middle-right pane, run circumflex.
echo "   - Starting circumflex in the middle-right pane..."
type_command "circumflex"
sleep 0.5

# Step 6: Create another horizontal split. Focus moves to the final bottom-right pane.
echo "   - Splitting pane horizontally again..."
keystroke_cmd_shift "d"
sleep 0.5

# Step 7: In the final pane, run fastfetch.
echo "   - Starting fastfetch in the bottom-right pane..."
type_command "fastfetch"
sleep 0.5

# Step 8 (Optional): Move focus back to the main yazi pane on the left.
echo "   - Returning focus to the main pane..."
keystroke_cmd_opt "left"

echo "✅ Dashboard layout created successfully!"

