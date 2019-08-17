#!/usr/bin/env bash

echo "installing paperbenni's neovim"

if ! [ -e ~/.local/share/nvim/site/autoload/plug.vim ]
then
	echo "Installing vim-plug"
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

cd
rm -rf .config/nvim
mkdir .config/nvim

curl https://raw.githubusercontent.com/paperbenni/nvim/master/init.vim > .config/nvim/init.vim

if ! python3 -c "import neovim"
then
	sudo pip3 install neovim pynvim
fi

if ! python2 -c "import neovim"
then
	sudo pip2 install neovim pynvim
fi

if ! npm list -g | grep 'neovim'
then
	sudo npm install -g nvim
fi

if ! gem list | grep 'neovim'
then
	sudo gem install neovim
fi

nvim -c "PlugInstall"
