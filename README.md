# CTX OS Core

Core configuration, branding, and utilities for [CTX OS](https://github.com/ctxos) — a Debian Bookworm-based Linux distribution.

## Overview

`ctxos-core` is a Debian source package (`Architecture: all`) that provides:
- System branding and identity (wallpaper, Plymouth theme, `os-release`)
- Repository mirroring tools (`ftpsync`, `runmirrors`, `rsync-ssl-tunnel`, `mirror-ctx-images`)
- Desktop environment defaults (XFCE, KDE/Plasma)
- System configuration (APT, DNS, PostgreSQL, Samba, xRDP)
- Shell profiles (Bash, Zsh, Fish)
- Developer setup tooling

## Scripts

### System Utilities
| Script | Description |
|--------|-------------|
| `ctx-about` | Display system info (neofetch-style) |
| `ctx-update` | System package updater (apt/dnf/pacman) |
| `ctx-dev-setup` | Developer environment setup (Docker, Node.js, VS Code, Python, local CA) |
| `archive_release` | Archive release artifacts with metadata |

### Mirror Tools
| Script | Description |
|--------|-------------|
| `ftpsync` | Sync local reprepro repository to a remote FTP server |
| `ftpsync-cron` | Cron wrapper for ftpsync with locking and retries |
| `runmirrors` | Push mirrors to downstream servers |
| `rsync-ssl-tunnel` | SSL tunnel wrapper for rsync |
| `mirror-ctx-images` | Rsync-based image mirror tool |

## Building

### Requirements
```bash
sudo apt-get install build-essential debhelper devscripts dpkg-dev pandoc
```

### Build .deb Package
```bash
bin/build.sh
# or manually:
debuild -us -uc
```

### Build with Docker
```bash
docker build -t ctxos-core .
docker run --rm -v $(pwd)/..:/output ctxos-core
```

### Install Locally
```bash
sudo apt install ../ctxos-core_*_all.deb
```

## Configuration

### Mirror Tools
Copy sample configs to `/etc/ftpsync/`:
```bash
sudo mkdir -p /etc/ftpsync
cp etc/ftpsync.conf.sample /etc/ftpsync/ftpsync.conf
cp etc/runmirrors.conf.sample /etc/ftpsync/runmirrors.conf
cp etc/runmirrors.mirror.sample /etc/ftpsync/runmirrors.mirror
```

### Deployment
Set `CTXOS_REPO_DIR` and run:
```bash
./push-update.sh
```

## Testing

Tests use [Bats](https://github.com/bats-core/bats-core) (Bash Automated Testing System):
```bash
bats tests/
```

## Project Structure

```
ctxos-core/
├── bin/            # Scripts and binaries
├── build/          # Build artifacts (boot images)
├── debian/         # Debian packaging (dpkg/debhelper)
├── docs/           # Documentation and man pages
├── etc/            # System configuration files
│   └── skel/       # User skeleton directory
├── lib/            # Systemd service units
├── tests/          # Bats test suite
├── usr/            # /usr/share overlay (logo, backgrounds, Plymouth)
├── Dockerfile      # Build container
├── Makefile        # Build system
└── push-update.sh  # Deployment script
```

## License

GPLv3 — see [LICENSE](LICENSE) for details.
