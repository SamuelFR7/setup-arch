#!/usr/bin/env bash

sudo pacman -S --noconfirm --needed \
  bat \
  btop \
  cargo \
  clang \
  docker \
  dust \
  eza \
  fastfetch \
  fd \
  fzf \
  gcc14 \
  git-crypt \
  github-cli \
  gum \
  jq \
  lazydocker \
  lazygit \
  less \
  llvm \
  luarocks \
  man \
  mise \
  nvim \
  postgresql-libs \
  python-gobject \
  python-poetry-core \
  python-terminaltexteffects \
  ripgrep \
  starship \
  stow \
  tldr \
  tmux \
  tree-sitter-cli \
  unzip \
  yay

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
