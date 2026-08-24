#!/usr/bin/env bash
# Bootstrap-script for ~/dotfiles
# Kør fra roden af repoet: ./install.sh

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES=(zsh git mise ssh)

echo "==> Dotfiles bootstrap fra $DOTFILES_DIR"

# --- 1. Homebrew ---
if ! command -v brew &>/dev/null; then
  echo "==> Homebrew ikke fundet, installerer..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# --- 2. Stow (hvis ikke allerede installeret via ovenstående Brewfile-kørsel) ---
if ! command -v stow &>/dev/null; then
  echo "==> Installerer GNU Stow..."
  brew install stow
fi

# --- 3. Symlink alle pakker med stow ---
echo "==> Symlinker dotfiles-pakker med stow..."
for pkg in "${PACKAGES[@]}"; do
  if [ -d "$DOTFILES_DIR/$pkg" ]; then
    echo "  - $pkg"
    stow --target="$HOME" --dir="$DOTFILES_DIR" --restow "$pkg"
  fi
done

# --- 4. Installer alt fra Brewfile ---
echo "==> Kører brew bundle install..."
brew bundle install --file="$DOTFILES_DIR/Brewfile"

echo "==> Færdig. Genstart terminalen eller kør: source ~/.zshrc"
