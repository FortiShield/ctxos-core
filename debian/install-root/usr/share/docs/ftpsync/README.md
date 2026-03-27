# CTX OS Mirror Tools

Utilities for syncing, mirroring, and managing CTX OS Debian repositories.

## Scripts

- **ftpsync** — Sync a local reprepro repository to a remote FTP server.
- **ftpsync-cron** — Cron-friendly wrapper around ftpsync with locking and retries.
- **runmirrors** — Push mirrors to downstream servers.
- **rsync-ssl-tunnel** — SSL tunnel wrapper for rsync.

## Configuration

Copy the sample configs to `/etc/ftpsync/`:

```
cp etc/ftpsync.conf.sample /etc/ftpsync/ftpsync.conf
cp etc/runmirrors.conf.sample /etc/ftpsync/runmirrors.conf
cp etc/runmirrors.mirror.sample /etc/ftpsync/runmirrors.mirror
```

## Building

```
make
sudo make install
```

## License

See individual source files for license information.
