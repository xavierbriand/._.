#!/usr/bin/env bash

if [ -d ~/.bash_it ]; then
    cd ~/.bash_it && git pull
else
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    ~/.bash_it/install.sh --silent
fi
case $OSTYPE in
    darwin*)
        CONFIG_FILE=.bash_profile
        ;;
    *)
        CONFIG_FILE=.bashrc
        ;;
esac

sed -i '' "s/BASH_IT_THEME='bobby'/BASH_IT_THEME='powerline-multiline'/" ~/$CONFIG_FILE

grep 'EDITOR' ~/$CONFIG_FILE || echo 'export EDITOR=vim' >> ~/$CONFIG_FILE

case $OSTYPE in
    darwin* | freebsd*)
        touch ~/.bash_profile
        grep 'source ~/\.bashrc' ~/.bash_profile || echo 'if [ -f ~/.bashrc ]; then source ~/.bashrc; fi' >> ~/.bash_profile
        ;;
    freebsd*)
esac

# tmux

if [ -d ~/.tmux/themes/nord-tmux ]; then
    cd ~/.tmux/themes/nord-tmux && git pull
else
    git clone https://github.com/arcticicestudio/nord-tmux ~/.tmux/themes/nord-tmux
fi

ln -sfn ~/._./tmux.conf ~/.tmux.conf

# vim

curl -fLo ~/.vim/autoload/plug.vim --progress --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sfn ~/._./vimrc ~/.vimrc
mkdir -p ~/.vim/backupdir
mkdir -p ~/.vim/undodir

# git

git config --global core.eol lf
git config --global core.excludesfile ~/._./gitignore
git config --global core.whitespace trailing-space,space-before-tab,tab-in-indent
git config --global core.editor vim

git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto
git config --global color.grep auto

git config --global merge.tool vimdiff
git config --global diff.tool vimdiff
git config --global pull.rebase true
git config --global status.showUntrackedFiles all
git config --global push.default matching

