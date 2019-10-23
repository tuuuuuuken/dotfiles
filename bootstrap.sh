#!/usr/bin/env bash

set -eu

DOTPATH=$HOME/dotfiles

if [ ! -d "$DOTPATH" ]; then
  git clone https://github.com/tuuuuuuken/dotfiles.git "$DOTPATH"
else
  echo "$DOTPATH already downloaded. Updating..."
  cd "$DOTPATH"
  git stash
  git checkout master
  git pull origin master
  echo
fi

cd "$DOTPATH"

scripts/deploy.sh
echo

# install homebrew
if ! command -v brew >/dev/null 2>&1; then
  # Install homebrew: https://brew.sh/
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo
fi


brew bundle --global
echo

echo "Bootstrapping DONE!"
