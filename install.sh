#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -eE

INSTALL_SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WORK_DIR="$INSTALL_SCRIPT_DIR/install"
export WORK_DIR="$WORK_DIR"

# Preparation
source $WORK_DIR/preflight/guard.sh
source $WORK_DIR/preflight/repositories.sh

# Packaging
source $WORK_DIR/packages.sh

# Config
source $WORK_DIR/config/gpg.sh
source $WORK_DIR/config/mise-node.sh

# Reboot
clear
echo
echo "You're done!"

sleep 5
reboot
