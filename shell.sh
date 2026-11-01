#!/usr/bin/env bash
set -euo pipefail

if ! command -v fish >/dev/null 2>&1; then
  sudo pacman -S --needed fish
fi

if ! fish -c 'type -q fisher'; then
  curl -sSfL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | fish -c 'source; and fisher install jorgebucaran/fisher'
fi

fish -c 'fisher update'

read -rp "Set Fish as your default shell? [y/N] " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
    chsh -s "$(command -v fish)"
fi
