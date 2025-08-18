#!/bin/bash
# Helper function to send keystrokes into Ghostty
send_to_ghostty() {
    local keys="$1"
    osascript -e 'tell application (path to frontmost application as text) to activate' \
              -e 'tell application "System Events" to keystroke "'"$keys"'"'
}

send_with_return() {
    local keys="$1"
    osascript -e 'tell application (path to frontmost application as text) to activate' \
              -e 'tell application "System Events" to keystroke "'"$keys"'"' \
              -e 'tell application "System Events" to keystroke return'
}

# --- Start workflow ---

# run yazi (bottom-right)
osascript -e 'tell application (path to frontmost application as text) to activate' \
          -e 'tell application "System Events" to keystroke "yazi"' \
          -e 'tell application "System Events" to keystroke return' \
          -e 'tell application "System Events" to keystroke "d" using command down'

sleep 1

# Split right and run fastfetch (top-right)
osascript -e 'tell application (path to frontmost application as text) to activate' \
          -e 'tell application "System Events" to keystroke "fastfetch"' \
          -e 'tell application "System Events" to keystroke return'

sleep 1

# Split down and run btop (bottom-left)
osascript -e 'tell application (path to frontmost application as text) to activate' \
          -e 'tell application "System Events" to keystroke "D" using command down' \
          -e 'tell application "System Events" to keystroke "btop"' \
          -e 'tell application "System Events" to keystroke return'

sleep 1

# Split right (or down, depending where you want weather) and run weather script
osascript -e 'tell application (path to frontmost application as text) to activate' \
        -e 'tell application "System Events" to keystroke "]" using command down' \
        -e 'tell application "System Events" to keystroke "D" using command down'

sleep 0.5

# Run the weather script in that split
send_with_return "bash /Users/akhil/Projects/repos/ghostty_mac_setup/weather.sh"