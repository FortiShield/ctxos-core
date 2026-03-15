#!/bin/bash
# CTX OS Build Script

set -e

echo "============================================"
echo "  CTX OS Package Builder"
echo "============================================"

VERSION=$(dpkg-parsechangelog -S Version)
echo "Building version: $VERSION"

echo ""
echo "📦 Cleaning previous builds..."
rm -f ../ctxos-core*.deb ../ctxos-core*.changes ../ctxos-core*.buildinfo ../ctxos-core*.dsc 2>/dev/null || true

echo ""
echo "🛠️ Building package..."
debuild -us -uc

echo ""
echo "📋 Build artifacts:"
ls -la ../ctxos-core*_all.deb 2>/dev/null || echo "No .deb found"

echo ""
echo "✅ Build complete: ../ctxos-core_${VERSION}_all.deb"
echo ""
echo "To install locally:"
echo "  sudo apt install ../ctxos-core_${VERSION}_all.deb"
echo ""
echo "To add to repository:"
echo "  reprepro -b /path/to/repo includedeb bookworm ../ctxos-core_${VERSION}_all.deb"
echo ""
