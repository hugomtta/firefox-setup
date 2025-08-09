#!/bin/bash

set -eo pipefail

# Check OS compatibility
OS="$(uname -s)"

if [[ "${OS}" != 'Linux' ]]; then
  echo 'This script is intended for Linux systems only.'
  exit 1
fi
