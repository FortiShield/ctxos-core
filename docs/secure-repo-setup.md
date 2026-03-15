# CTX OS Secure GPG Repository Setup

## Overview

This guide explains how to set up a GPG-signed Apt repository for secure package distribution.

## Step 1: Generate GPG Key

On your repository server:

```bash
gpg --full-generate-key
```

- Type: RSA and RSA (default)
- Key size: 4096
- Real Name: CTX OS Repository
- Email: repo@ctxos.local

Find your Key ID:

```bash
gpg --list-keys --keyid-format LONG
```

Example ID: `ABC1234567890DEF`

## Step 2: Configure Reprepro

Edit `/var/www/repos/debian/conf/distributions`:

```
Origin: CTX-OS
Label: CTX OS Repository
Codename: bookworm
Architectures: amd64 all
Components: main
Description: Apt repository for CTX OS custom configurations
SignWith: ABC1234567890DEF
```

## Step 3: Export Public Key

```bash
gpg --armor --export ABC1234567890DEF > /var/www/repos/debian/ctxos-archive-key.gpg
```

## Step 4: Update Client Configuration

Update `etc/apt/sources.list.d/ctx.list` in your project:

```
deb [signed-by=/usr/share/keyrings/ctxos-archive-key.gpg] http://repo.ctxos.local/ bookworm main
```

## Step 5: Automate Key Installation

Add to `debian/postinst`:

```bash
# Import CTX OS Repository Key
if [ ! -f /usr/share/keyrings/ctxos-archive-key.gpg ]; then
    echo "Importing CTX OS Repository Key..."
    curl -s http://repo.ctxos.local/ctxos-archive-key.gpg | gpg --dearmor -o /usr/share/keyrings/ctxos-archive-key.gpg
fi
```

## Add Package (Signed)

```bash
reprepro includedeb bookworm ctxos-core_1.1.0_all.deb
```

## Infrastructure Summary

| Component | Description |
|-----------|-------------|
| Project | Clean, FHS-compliant source tree |
| Package | .deb for system tuning, UI, dev tools |
| Repository | GPG-signed Nginx server |
| Updates | `apt update && apt upgrade` |
