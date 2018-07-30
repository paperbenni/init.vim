#!/bin/bash

sudo apt update
sudo apt-get install -y shellcheck python python3 zsh

# install vim-plug
echo "installing vim-plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ -e ~/.config/nvim ]
    echo "nvim config folder found"
else
    mkdir -p ~/.config/nvim
    echo "created config folder"
fi

pushd ~/.config/nvim

curl https://raw.githubusercontent.com/paperbenni/nvim/master/init.vim > init.vim
curl https://raw.githubusercontent.com/paperbenni/nvim/master/ginit.vim > ginit.vim

popd
