#!/bin/bash

# # Check if the terminal is Kitty using the KITTY_PID environment variable
# if [[ -n "$KITTY_PID" ]]; then
#   kitty @ set-spacing padding=0
#   nvim "$@"
#   kitty @ set-spacing padding=default
# else
#   # Do nothing if not Kitty
#   nvim "$@"
# fi

# Check if the terminal is Kitty using the KITTY_PID environment variable
if [[ -n "$KITTY_PID" ]]; then
  # Set padding to 0
  kitty @ set-spacing padding=0
  # Add a short delay to ensure the padding command is applied
  sleep 0.1
  # Launch Neovim
  nvim "$@"
  # Restore default padding
  sleep 0.1
  kitty @ set-spacing padding=default
else
  # Launch Neovim normally if not in Kitty
  nvim "$@"
fi
