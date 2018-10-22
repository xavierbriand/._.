if [ ! -d ~/.bash_it ]; then
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

sed -i ''  "s/BASH_IT_THEME='bobby'/BASH_IT_THEME='powerline-multiline'/" ~/$CONFIG_FILE

grep 'EDITOR' ~/$CONFIG_FILE || echo 'export EDITOR=vim' >> ~/$CONFIG_FILE

if [[ $OSTYPE == darwin* ]]; then
    grep 'source ~/\.bashrc' ~/.bash_profile || echo 'if [ -f ~/.bashrc ]; then source ~/.bashrc; fi' >> ~/.bash_profile
fi
