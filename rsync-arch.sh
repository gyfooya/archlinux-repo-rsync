#!/usr/bin/env bash
#
# GYFOOYA ARCHLINUX CUSTOM RSYNC REPO
# 05 Jun 2026
#

set -euo pipefail

SOURCE="rsync://frankfurt.mirror.pkgbuild.com/packages/"
DEST="/run/media/noname/mountpoint/mirror/archlinux/"

echo "========================================"
echo " Arch Linux Mirror Synchronization"
echo " Started: $(date)"
echo "========================================"
echo

rsync -rtlH \
    --safe-links \
    --delay-updates \
    --delete-after \
    --partial \
    --timeout=600 \
    --contimeout=60 \
    --exclude='*-debug/' \
    --exclude='*-testing/' \
    --exclude='*-staging/' \
    --exclude='gnome-unstable/' \
    --exclude='kde-unstable/' \
    --exclude='images/' \
    --exclude='iso/' \
    --exclude='latest/' \
    --exclude='multilib/' \
    --exclude='wsl/' \
    --info=progress2,name0 \
    --human-readable \
	--stats \
    "$SOURCE" \
    "$DEST"

# --info=progress2
echo
echo "========================================"
echo " ✅ Arch mirror sync complete"
echo " Finished: $(date)"
echo "========================================"

