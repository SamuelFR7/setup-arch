#!/usr/bin/env bash

# Setup GPG configuration with multiple keyservers for better reliability
sudo mkdir -p /etc/gnupg
sudo cp "$WORK_DIR/default/gpg/dirmngr.conf" /etc/gnupg/
sudo chmod 644 /etc/gnupg/dirmngr.conf
sudo gpgconf --kill dirmngr || true
sudo gpgconf --launch dirmngr || true

gpg --receive-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22

yay -S 1password-cli