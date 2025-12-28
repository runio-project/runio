#!/usr/bin/env bash
# Build branding images from source
# Requires: ImageMagick (magick command)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
SYSTEM_FILES="$REPO_ROOT/system_files"

# Source image (update this to your source file)
SOURCE_IMAGE="$SCRIPT_DIR/logo.png"

if [[ ! -f "$SOURCE_IMAGE" ]]; then
    echo "Error: Source image not found: $SOURCE_IMAGE"
    echo "Place your source logo at: $SOURCE_IMAGE"
    exit 1
fi

echo "Building branding images from: $SOURCE_IMAGE"

# Plymouth boot splash watermark (128x32, logo centered)
echo "  -> Plymouth watermark (128x32)"
magick "$SOURCE_IMAGE" \
    -background none \
    -resize 122x32 \
    -gravity center \
    -extent 128x32 \
    "$SYSTEM_FILES/usr/share/plymouth/themes/spinner/watermark.png"

# KDE About dialog logo (252x252)
echo "  -> KDE About logo (252x252)"
magick "$SOURCE_IMAGE" \
    -background none \
    -resize 252x252 \
    -gravity center \
    -extent 252x252 \
    "$SYSTEM_FILES/usr/share/pixmaps/system-logo-white.png"

# KDE Plasma splash screen logo
echo "  -> KDE splash logo"
magick "$SOURCE_IMAGE" \
    -background none \
    -resize 256x256 \
    -gravity center \
    "$SYSTEM_FILES/usr/share/plasma/look-and-feel/dev.getaurora.aurora.desktop/contents/splash/images/aurora_logo.svgz"

echo "Done! Branding images updated."
