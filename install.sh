git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh --silent

sed -i ''  "s/BASH_IT_THEME='bobby'/BASH_IT_THEME='powerline-multiline'/" ~/.bash_profile
