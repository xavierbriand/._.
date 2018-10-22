if [ ! -d ~/.bash_it ]; then
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    ~/.bash_it/install.sh --silent
fi

sed -i ''  "s/BASH_IT_THEME='bobby'/BASH_IT_THEME='powerline-multiline'/" ~/.bash_profile

grep 'EDITOR' ~/.bash_profile            || echo 'export EDITOR=vim' >> ~/.bash_profile
grep 'source ~/\.bashrc' ~/.bash_profile || echo 'if [ -f ~/.bashrc ]; then source ~/.bashrc; fi' >> ~/.bash_profile
