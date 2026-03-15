# ~/.bashrc: executed by bash(1) for non-login shells.
# CtxOS Custom Configuration

export CTXOS_VERSION=$(cat /etc/ctx/debian_version 2>/dev/null)
export CTXOS_HOME="/opt/ctxos"

# Custom Prompt: [ctxos] user@host:pwd$
PS1='\[\e[1;32m\][ctxos] \[\e[m\]\u@\h:\w\$ '

# History settings
HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias update='sudo ctx-update'
alias ctx-logs='sudo journalctl -xe'
alias ctx-net='sudo netstat -tulpn'

# Editor
export EDITOR=vim
export VISUAL=vim

# Path
export PATH="$HOME/bin:$HOME/.local/bin:/opt/ctxos/bin:$PATH"

# Load global config if exists
[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc
