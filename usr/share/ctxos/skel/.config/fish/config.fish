# CtxOS Fish Shell Configuration
# Default config for new users

set -g CTXOS_VERSION "1.0.0"
set -g CTXOS_HOME "/opt/ctxos"

set -g fish_greeting "Welcome to CtxOS 1.0.0"

set -g EDITOR vim
set -g VISUAL vim

set -gx PATH $PATH /usr/local/bin /opt/ctxos/bin

# Aliases
alias ll 'ls -la'
alias la 'ls -A'
alias l 'ls -CF'

# Context-specific aliases for security operations
alias ctx-scan 'echo "Running security scan..."'
alias ctx-logs 'sudo journalctl -xe'
alias ctx-net 'sudo netstat -tulpn'
