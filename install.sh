#!/usr/bin/env zsh

if [ ! -d ~/.config/nvim ]; then
  echo "Please install Neovim first"
  exit 1
fi

if [ ! -f ~/.config/nvim/custom ]; then
  ln -s ~/._./nvim ~/.config/nvim/custom
fi

# git

git config --global core.eol lf
git config --global core.excludesfile ~/._./gitignore
git config --global core.whitespace trailing-space,space-before-tab,tab-in-indent
git config --global core.editor nvim

git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto
git config --global color.grep auto

git config --global pull.rebase true
git config --global status.showUntrackedFiles all
git config --global push.default matching
