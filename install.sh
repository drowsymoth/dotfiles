#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

mkdir -p "$HOME/.config"

ln -sfn "$DOTFILES/nvim" "$HOME/.config/nvim"
ln -sfn "$DOTFILES/ghostty" "$HOME/.config/ghostty"
ln -sfn "$DOTFILES/.zshrc" "$HOME/.zshrc"
