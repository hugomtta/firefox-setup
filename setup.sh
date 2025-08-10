#!/bin/bash

set -eo pipefail

# Check if Firefox is already installed
if command -v firefox &>/dev/null; then
  echo 'Firefox is already installed.'
  exit 0
fi

# Check OS compatibility
OS="$(uname -s)"
ARCH="$(uname -m)"

if [[ "${OS}" != 'Linux' || "${ARCH}" != 'x86_64' ]]; then
  echo 'This script is intended for Linux 64-bit systems only.'
  exit 1
fi

# Create temporary directory
TEMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TEMP_DIR}"' EXIT

# Set Firefox language
FIREFOX_LANG='en-US'

# Remove and recreate Firefox directory
FIREFOX_DIR='/opt/firefox'
sudo rm -rf "${FIREFOX_DIR}" && sudo mkdir -p "${FIREFOX_DIR}"

# Download and install Firefox
URL="https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=${FIREFOX_LANG}"
curl -L "${URL}" | sudo tar -xJC "${FIREFOX_DIR}" --strip-components=1

# Create symbolic link to Firefox binary
sudo ln -sf "${FIREFOX_DIR}/firefox" /usr/local/bin/firefox
