# ~/.profile: executed by the command interpreter for login shells.
# CtxOS User Profile

# Set language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Load .bashrc if using bash
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Path for local binaries and scripts
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# CTXOS
export CTXOS_VERSION=$(cat /etc/ctx/debian_version 2>/dev/null)
export CTXOS_HOME="/opt/ctxos"
