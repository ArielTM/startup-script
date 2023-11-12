#!/bin/sh

sudo apt update && sudo apt dist-upgrade -y && sudo apt install zsh vim jq tmux git aria2 net-tools python3-pip pv build-essential pigz unzip curl -y

RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf && cp .tmux/.tmux.conf.local .

sed 's/ZSH_THEME=.*/ZSH_THEME="agnoster"/g' .zshrc > .tmpzshrc && mv .tmpzshrc .zshrc
sed 's/plugins=(.*)/plugins=(git command-not-found docker tmux)\nZSH_TMUX_AUTOSTART=true\nexport EDITOR=vim/g' .zshrc > .tmpzshrc && mv .tmpzshrc .zshrc

echo "Resarting in 5..."
sleep 5
sudo shutdown -r now
