#!/bin/bash
# CTX OS Build & GitHub Deploy Automation
set -euo pipefail

REPO_DIR="${CTXOS_REPO_DIR:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"
CODENAME="bookworm"

echo "📦 Step 1: Building the package..."
debuild -us -uc

DEB_FILE=$(ls -t ../ctxos-core*_all.deb | head -n 1)

echo "📥 Step 2: Adding to local repo via reprepro..."
reprepro -b "$REPO_DIR/debian" includedeb "$CODENAME" "$DEB_FILE"

echo "📤 Step 3: Pushing to GitHub Pages..."
cd "$REPO_DIR"
git add .
git commit -m "Update ctxos-core to version $(dpkg-parsechangelog -S Version)"
git push origin main

echo "✅ Success! Update is now live at https://ctxos.github.io/debian"
