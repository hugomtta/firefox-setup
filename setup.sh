#!/bin/bash

set -eo pipefail

# Check OS compatibility
OS="$(uname -s)"
ARCH="$(uname -m)"

if [[ "${OS}" != 'Linux' || "${ARCH}" != 'x86_64' ]]; then
  echo 'This script is intended for Linux 64-bit systems only.'
  exit 1
fi
