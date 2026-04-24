# CTX OS Core - Environment Variables

This document lists all environment variables used by CTX OS Core scripts.

## Mirror Tools (ftpsync, runmirrors, etc.)

| Variable | Default | Description | Used In |
|----------|---------|-------------|---------|
| `CTXOS_REPO_DIR` | `/var/lib/ctxos/debian` | Repository directory for git includes | `include-git` |
| `CTXOS_CODENAME` | `bookworm` | Debian codename | `include-git` |
| `CTXOS_INCLUDE_WORKDIR` | `/tmp/ctxos-include` | Working directory for git includes | `include-git` |
| `CTXOS_INCLUDE_LOG` | `/var/log/ctxos-include-git.log` | Log file for include-git | `include-git` |
| `CTXOS_INCLUDE_TAG` | `0` | Whether to tag after successful build | `include-git` |
| `CTXOS_FTPSYNC_CONF` | `/etc/ctxos/ftpsync.conf` | Path to ftpsync config | `ftpsync-cron` |
| `CTXOS_FTPSYNC_LOCK` | `/run/lock/ctxos-ftpsync.lock` | Lock file path | `ftpsync-cron` |
| `CTXOS_FTPSYNC_LOG` | `/var/log/ctxos-ftpsync.log` | Log file path | `ftpsync-cron` |
| `CTXOS_FTPSYNC_RETRIES` | `3` | Number of retry attempts | `ftpsync-cron` |
| `CTXOS_FTPSYNC_RETRY_DELAY` | `60` | Delay between retries (seconds) | `ftpsync-cron` |
| `CTXOS_ARCHIVE_DIR` | `/var/lib/ctxos/archive` | Archive destination directory | `archive_release` |

## System Configuration

| Variable | Default | Description | Used In |
|----------|---------|-------------|---------|
| `CTX_UPDATE_LOG` | `/var/log/ctx-update.log` | Log file for system updates | `ctx-update` |

## Common Library (bin/common)

| Variable | Default | Description | Used In |
|----------|---------|-------------|---------|
| `BASEDIR` | Auto-detected | Base directory of the project | `common` |
| `BINDIR` | Auto-detected | Binary directory | `common` |
| `CONFDIRS` | Multiple paths | Configuration directories | `common` |
| `LOCKDIR` | `$BASEDIR/locks` | Lock files directory | `common` |
| `LOGDIR` | `$BASEDIR/log` | Log files directory | `common` |
| `PROGRAM` | Auto-detected | Program name | `common` |
| `VERSION` | `dev` | Program version | `common` |

## SSH and Remote Access

| Variable | Default | Description | Used In |
|----------|---------|-------------|---------|
| `SSH_ORIGINAL_COMMAND` | (none) | Original SSH command for remote execution | `runmirrors`, `mirror-ctx-images` |
| `USERNAME` | (none) | SSH username | `common` |
| `SSHPROTO` | (none) | SSH protocol type | `common` |
| `SSHKEY` | (none) | SSH key path | `common` |
| `SSHOPTS` | (none) | Additional SSH options | `common` |

## FTP Sync (ftpsync)

| Variable | Default | Description | Used In |
|----------|---------|-------------|---------|
| `FTP_HOST` | (none) | FTP host for mirror sync | `ftpsync` |
| `FTP_USER` | (none) | FTP username | `ftpsync` |
| `FTP_PASS` | (none) | FTP password | `ftpsync` |

## Git Includes (include-git)

| Variable | Default | Description | Used In |
|----------|---------|-------------|---------|
| `GIT_URL` | (none) | Git repository URL or local path | `include-git` |

## API / Trigger Endpoints

Most scripts support being triggered via SSH with `SSH_ORIGINAL_COMMAND` set to:
- `sync:archive:<name>` - Trigger ftpsync for archive
- `<component>` - Trigger mirror-ctx-images for component

## Setting Environment Variables

### System-wide (recommended)
Create `/etc/default/ctxos`:
```bash
export CTXOS_FTPSYNC_LOG="/var/log/custom-ftpsync.log"
export CTXOS_FTPSYNC_RETRIES=5
```

### Per-script
```bash
CTXOS_FTPSYNC_RETRIES=5 ftpsync-cron
```

### Via config files
Most tools read from config files in `/etc/ctxos/` or `/etc/ftpsync/`.
