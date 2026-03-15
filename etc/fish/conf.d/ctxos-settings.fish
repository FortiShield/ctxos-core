# CtxOS Fish Shell Configuration
# System-wide settings for all users

set -g CTXOS_VERSION "1.0.0"
set -g CTXOS_HOME "/opt/ctxos"

set -g fish_greeting ""

set -g EDITOR vim
set -g VISUAL vim

set -g fish_color_command blue
set -g fish_color_param cyan
set -g fish_color_error red
set -g fish_color_normal normal

if status is-interactive
    # Enable vim key bindings
    bind -M insert \e\[1~ beginning-of-line
    bind -M insert \e\[4~ end-of-line
    bind -M insert \e\[3~ delete-char
    bind -M insert \e\[2~ overwrite-mode
end
