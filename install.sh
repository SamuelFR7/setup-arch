#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -eE

INSTALL_SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
export PATH="$INSTALL_SCRIPT_DIR/bin:$PATH"
WORK_DIR="$INSTALL_SCRIPT_DIR/install"
export WORK_DIR="$WORK_DIR"

# Preparation
source $WORK_DIR/preflight/guard.sh
source $WORK_DIR/preflight/repositories.sh

# Packaging
source $WORK_DIR/packages.sh
source $WORK_DIR/packaging/tuis.sh

# Config
source $WORK_DIR/config/theme.sh
source $WORK_DIR/config/gpg.sh
source $WORK_DIR/config/detect-keyboard-layout.sh
source $WORK_DIR/config/mise-node.sh
source $WORK_DIR/config/docker.sh
source $WORK_DIR/config/mimetypes.sh
source $WORK_DIR/config/localdb.sh
source $WORK_DIR/config/hardware/usb-autosuspend.sh

# Reboot
clear
echo
echo "You're done! So we're ready to reboot now..."

sleep 5
reboot
