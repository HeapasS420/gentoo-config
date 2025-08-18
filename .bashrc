# ~/.bashrc . file sourced by ~/.bash_profile to configure the interactive shell

# NOTE:Test for an interactive shell.  There is no need to set anything for scp
# and rcp past this point.
if [[ $- != *i* ]] ; then
	return
fi

# Settings ====================================================================

# Source files in ~/.config/bash/bashrc.d .
config=~/.config/bash/bashrc.d
if [ -d "$config" ]; then
    for file in "$config"/*; do
        [ -r "$file" ] && . "$file"
    done
fi

# Set history file.
export HISTFILE="${XDG_CACHE_HOME}/bash/history"
# No double entries in the shell history .
export HISTCONTROL="${HISTCONTROL} erasedups:ignoreboth"

# Do not overwrite files when redirecting output by default.
set -o noclobber

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
