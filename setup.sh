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
