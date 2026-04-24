% CTX-UPDATE(1) CTX OS Core | CTX OS Documentation
%
%

# NAME

ctx-update - Update CTX OS packages

# SYNOPSIS

`ctx-update`

# DESCRIPTION

`ctx-update` updates all packages on a CTX OS system. It detects the available package manager and uses the appropriate update method:

- **apt-get** (Debian/Ubuntu) - Updates package lists, upgrades packages, cleans up
- **dnf** (Fedora/RHEL) - Updates all packages
- **pacman** (Arch Linux) - Syncs and updates all packages

After updating, it restarts the dnsmasq service if available.

# ENVIRONMENT

- `CTX_UPDATE_LOG` - Log file path (default: `/var/log/ctx-update.log`)

# FILES

- `/var/log/ctx-update.log` - Update log file

# SEE ALSO

`ctx-about`(1), `ctx-dev-setup`(1)
