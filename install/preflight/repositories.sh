#!/usr/bin/env bash

# Install build tools
sudo pacman -S --needed --noconfirm base-devel

# Only add Chaotic-AUR if the architecture is x86_64 so ARM users can build the packages
if [[ "$(uname -m)" == "x86_64" ]] && [ -z "$DISABLE_CHAOTIC" ]; then
  # Try installing Chaotic-AUR keyring and mirrorlist
  if ! pacman-key --list-keys 3056513887B78AEB >/dev/null 2>&1 &&
    sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com &&
    sudo pacman-key --lsign-key 3056513887B78AEB &&
    sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' &&
    sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'; then

    # Add Chaotic-AUR repo to pacman config
    if ! grep -q "chaotic-aur" /etc/pacman.conf; then
      echo -e '\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a /etc/pacman.conf >/dev/null
    fi

  else
    echo -e "Failed to install Chaotic-AUR, so won't include it in pacman config!"
  fi
fi

# Add omarchy repo
if ! grep -q "omarchy" /etc/pacman.conf; then
  echo -e '\n[omarchy]\nSigLevel = Optional TrustAll\nServer = https://pkgs.omarchy.org/$arch' | sudo tee -a /etc/pacman.conf >/dev/null
fi

# Refresh all repos
sudo pacman -Syu --noconfirm
