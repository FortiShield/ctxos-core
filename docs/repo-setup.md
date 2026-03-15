# CTX OS Local Apt Repository Setup

## Overview

This guide explains how to set up a local Apt repository for distributing CTX OS configurations across multiple machines.

## Prerequisites

```bash
sudo apt update
sudo apt install reprepro nginx
```

## Repository Structure

Create the repository directory:

```bash
sudo mkdir -p /var/www/repos/debian/conf
sudo chown -R $USER:$USER /var/www/repos
```

## Configuration

Create `/var/www/repos/debian/conf/distributions`:

```
Origin: CTX-OS
Label: CTX OS Repository
Codename: bookworm
Architectures: amd64 all
Components: main
Description: Apt repository for CTX OS custom configurations
```

## Add Package

```bash
cd /var/www/repos/debian
reprepro includedeb bookworm /path/to/ctxos-core_1.0.0_all.deb
```

## Nginx Configuration

Create `/etc/nginx/sites-available/ctx-repo`:

```nginx
server {
    listen 80;
    server_name repo.ctxos.local;

    root /var/www/repos/debian;
    index index.html;

    location / {
        autoindex on;
    }
}
```

Enable and restart:

```bash
sudo ln -s /etc/nginx/sites-available/ctx-repo /etc/nginx/sites-enabled/
sudo systemctl restart nginx
```

## Client Configuration

Add to `/etc/apt/sources.list.d/ctx.list`:

```
deb [trusted=yes] http://repo.ctxos.local/ bookworm main
```

## Update Workflow

1. Update version in `debian/changelog`
2. Run `debuild -us -uc`
3. On server: `reprepro includedeb bookworm ctxos-core_new_version.deb`
4. On clients: `sudo apt update && sudo apt upgrade`
