# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[ -f ~/.bashrc ] && . ~/.bashrc

# Environment variables.
export PATH="$HOME/.local/bin:${XDG_DATA_HOME}/go/bin:${XDG_DATA_HOME}/nvim/mason/bin${PATH:+:}${PATH}"
export EDITOR="/usr/bin/nvim"
export TERMINAL="footclient"
export BROWSER="firefox-bin"
export READER="zahura"

# Start wayland compositor only if it isn't already running.
if [ -z "$WAYLAND_DISPLAY" ] && [ $(tty) = "/dev/tty1" ]; then
	pgrep -x dwl || slstatus -s | dbus-run-session dwl; exit
fi
