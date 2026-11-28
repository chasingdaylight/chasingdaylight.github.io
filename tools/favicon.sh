#!/usr/bin/env bash
# Writes the site's icons from the avatar (assets/brand/), into assets/:
# favicon.ico (16, 32 and 48 pixels), icon-192.png, and apple-touch-icon.png
# (180). They are generated: change the avatar and run this again, never edit
# them.
#
#   tools/favicon.sh
#
# Needs ImageMagick 7 (`magick`). Run from the repository's root.
set -euo pipefail

# the avatar on its white background: it reads on a light and a dark tab alike
avatar=assets/brand/avatar-white.png
render() { magick "$avatar" -resize "$1x$1" -depth 8 "$2"; }

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
for n in 16 32 48; do render "$n" "$tmp/$n.png"; done
magick "$tmp/16.png" "$tmp/32.png" "$tmp/48.png" assets/favicon.ico
render 192 assets/icon-192.png
render 180 assets/apple-touch-icon.png
echo "assets/: favicon.ico, icon-192.png, apple-touch-icon.png from $avatar"
