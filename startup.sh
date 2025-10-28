#!/bin/sh

sudo apt update && sudo apt dist-upgrade -y && sudo apt install zsh vim jq tmux git aria2 net-tools python3-pip pv build-essential pigz unzip curl -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/gpakosz/.tmux.git && ln -s -f .tmux/.tmux.conf && cp .tmux/.tmux.conf.local .
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed 's/ZSH_THEME=.*/ZSH_THEME="agnoster"/g' .zshrc > .tmpzshrc && mv .tmpzshrc .zshrc
sed 's/plugins=(.*)/plugins=(git command-not-found docker tmux zsh-autosuggestions zsh-syntax-highlighting zbell)\nzbell_use_notify_send=false\nZSH_TMUX_AUTOSTART=true\nexport EDITOR=vim/g' .zshrc > .tmpzshrc && mv .tmpzshrc .zshrc

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime && sh ~/.vim_runtime/install_awesome_vimrc.sh
echo "set number" >> ~/.vim_runtime/my_configs.vim

curl -LsSf https://astral.sh/uv/install.sh | sh

sudo chsh -s "$(which zsh)" "$USER"

echo "Resarting in 5..."
sleep 5
sudo shutdown -r now
