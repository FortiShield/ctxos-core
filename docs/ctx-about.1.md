% CTX-ABOUT(1) CTX OS Core | CTX OS Documentation
%
%

# NAME

ctx-about - Display CTX OS system information

# SYNOPSIS

`ctx-about`

# DESCRIPTION

`ctx-about` displays system information for CTX OS including:
- Operating System name
- Kernel version
- Uptime
- Current shell
- Memory usage (used/total in MB)

The output includes the CTX OS ASCII logo if available at `/usr/share/ctxos/ascii-logo.txt`.

# ENVIRONMENT

- `LOGO_PATH` - Path to ASCII logo file (default: `/usr/share/ctxos/ascii-logo.txt`)

# FILES

- `/etc/os-release` - OS identification
- `/usr/share/ctxos/ascii-logo.txt` - Optional ASCII logo

# SEE ALSO

`ctx-update`(1), `ctx-dev-setup`(1)
