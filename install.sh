#!/bin/bash

pushd ~/

if [ -e .nvimpackages ]
then
    echo "all packages already installed"
else
    if [ ! -e .fonts ]
    then
        mkdir fonts
    fi
    pushd .fonts
    curl -o SourceCodePowerline.otf https://github.com/powerline/fonts/blob/master/SourceCodePro/Source%20Code%20Pro%20for%20Powerline.otf
    popd
    fc-cache -f -v
    sudo apt update
    sudo apt-get install -y neovim shellcheck python python3 zsh nodejs python3-pip python-pip npm ruby-full clang
    pip install neovim
    pip3 install neovim
    sudo npm install -g neovim
    sudo gem install neovim
    echo "true" > .nvimpackages
fi

# install vim-plug
echo "installing vim-plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ -e ~/.config/nvim ]
then
    echo "nvim config folder found"
else
    mkdir -p ~/.config/nvim
    echo "created config folder"
fi

pushd ~/.config/nvim

curl https://raw.githubusercontent.com/paperbenni/nvim/master/init.vim > init.vim
curl https://raw.githubusercontent.com/paperbenni/nvim/master/ginit.vim > ginit.vim

popd
popd
