#!/usr/bin/env bash
# Build branding images from source
# Requires: ImageMagick (magick command)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
SYSTEM_FILES="$REPO_ROOT/system_files"

# Source images
# - logo.png: Square/rectangular logo for KDE dialogs and splash
# - logo-wide.png: Wide/long logo for Plymouth boot screen watermark
SOURCE_LOGO="$SCRIPT_DIR/logo.png"
SOURCE_LOGO_WIDE="$SCRIPT_DIR/logo-wide.png"

if [[ ! -f "$SOURCE_LOGO" ]]; then
    echo "Error: Source image not found: $SOURCE_LOGO"
    echo "Place your square/rectangular logo at: $SOURCE_LOGO"
    exit 1
fi

if [[ ! -f "$SOURCE_LOGO_WIDE" ]]; then
    echo "Error: Wide logo not found: $SOURCE_LOGO_WIDE"
    echo "Place your wide/long logo at: $SOURCE_LOGO_WIDE"
    exit 1
fi

echo "Building branding images..."
echo "  Square logo: $SOURCE_LOGO"
echo "  Wide logo:   $SOURCE_LOGO_WIDE"

# Plymouth boot splash watermark (wide logo, fills more of the 128x32 space)
echo "  -> Plymouth watermark (128x32)"
magick "$SOURCE_LOGO_WIDE" \
    -background none \
    -resize 128x32 \
    -gravity center \
    -extent 128x32 \
    "$SYSTEM_FILES/usr/share/plymouth/themes/spinner/watermark.png"

# KDE About dialog logo (252x252)
echo "  -> KDE About logo (252x252)"
magick "$SOURCE_LOGO" \
    -background none \
    -resize 252x252 \
    -gravity center \
    -extent 252x252 \
    "$SYSTEM_FILES/usr/share/pixmaps/system-logo-white.png"

# KDE Plasma splash screen logo
echo "  -> KDE splash logo"
magick "$SOURCE_LOGO" \
    -background none \
    -resize 256x256 \
    -gravity center \
    "$SYSTEM_FILES/usr/share/plasma/look-and-feel/dev.getaurora.aurora.desktop/contents/splash/images/aurora_logo.svgz"

echo "Done! Branding images updated."
