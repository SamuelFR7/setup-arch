#!/usr/bin/env bash

abort() {
  echo -e "\e[31mThis install requires: $1\e[0m"
  echo
  exit 1
}

# Must be an Arch distro
[[ -f /etc/arch-release ]] || abort "Vanilla Arch"

# Must not be an Arch derivative distro
for marker in /etc/cachyos-release /etc/eos-release /etc/garuda-release /etc/manjaro-release; do
  [[ -f "$marker" ]] && abort "Vanilla Arch"
done

# Must not be running as root
[ "$EUID" -eq 0 ] && abort "Running as root (not user)"

# Must be x86 only to fully work
[ "$(uname -m)" != "x86_64" ] && abort "x86_64 CPU"

# Cleared all guards
echo "Guards: OK"
