#!/usr/bin/env bash

DOTPATH="$HOME/dotfiles"

if [ ! -e "$DOTPATH" ]; then
  echo "Error: Directory $DOTPATH does not exist."
  exit 1
fi

cd "$DOTPATH" || exit 1

# dotfiles
echo "start copy dotfiles"

for file in .??*; do
  [[ "$file" == ".git" ]] && continue
  [[ "$file" == ".gitignore" ]] && continue
  [[ "$file" == ".DS_Store" ]] && continue
  [[ "$file" == ".travis.yml" ]] && continue
  ln -fvns "$DOTPATH/$file" "$HOME/$file"
done

echo "finish copy dotfiles"

# bin
echo "start copy bin"

mkdir -p ~/bin
find "$DOTPATH/bin/" -type f -executable -exec ln -fvns {} ~/bin/ \;

echo "finish copy bin"