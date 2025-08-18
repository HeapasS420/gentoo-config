# /etc/skel/.bashrc

# This file is sourced when a login shell terminates.

# Kill pipewire
pkill -u "${USER}" -x pipewire\|wireplumber
# Clear the screen for security's sake.
clear
