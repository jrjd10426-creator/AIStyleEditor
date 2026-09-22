#!/bin/sh
set -e
BASE_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
if command -v gradle >/dev/null 2>&1; then
  exec gradle "$@"
fi

GRADLE_VERSION="8.9"
DIST_DIR="${GRADLE_USER_HOME:-$HOME/.gradle}/wrapper/dists/gradle-${GRADLE_VERSION}-bin"
INSTALL_DIR="$DIST_DIR/gradle-${GRADLE_VERSION}"
ZIP_FILE="$DIST_DIR/gradle-${GRADLE_VERSION}-bin.zip"
mkdir -p "$DIST_DIR"

if [ ! -x "$INSTALL_DIR/bin/gradle" ]; then
  if command -v curl >/dev/null 2>&1; then
    curl -fL --retry 3 "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -o "$ZIP_FILE"
  elif command -v wget >/dev/null 2>&1; then
    wget -O "$ZIP_FILE" "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
  else
    echo "Gradle is not installed and curl/wget is unavailable." >&2
    exit 1
  fi
  if command -v unzip >/dev/null 2>&1; then
    rm -rf "$INSTALL_DIR"
    unzip -q "$ZIP_FILE" -d "$DIST_DIR"
  else
    echo "unzip is required to bootstrap Gradle." >&2
    exit 1
  fi
fi

exec "$INSTALL_DIR/bin/gradle" "$@"
