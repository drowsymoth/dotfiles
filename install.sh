#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/fish"

ln -sfn "$DOTFILES/nvim" "$HOME/.config/nvim"
ln -sfn "$DOTFILES/ghostty" "$HOME/.config/ghostty"
ln -sfn "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sfn "$DOTFILES/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -sfn "$DOTFILES/fish/fish_plugins" "$HOME/.config/fish/fish_plugins"

"$DOTFILES/shell.sh"
