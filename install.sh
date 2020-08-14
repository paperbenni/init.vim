#!/usr/bin/env bash

echo "installing paperbenni's neovim config"
echo "warning, this will override existing configs"

checkcommand() {
	if ! command -v "$1"; then
		echo "$1 not found, please install"
		sleep 2
	fi
}

checkcommand npm
checkcommand node
checkcommand pip

if ! [ -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
	echo "Installing vim-plug"
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

cd
rm -rf .config/nvim
mkdir .config/nvim

echo "installing init.vim"
curl -s https://raw.githubusercontent.com/paperbenni/nvim/master/init.vim >.config/nvim/init.vim

echo "installing neovim providers"
if ! python3 -c "import neovim"; then
	sudo pip3 install neovim pynvim
fi

if ! python2 -c "import neovim"; then
	sudo pip2 install neovim pynvim
fi

if ! npm list -g | grep 'neovim'; then
	sudo npm install -g neovim
fi

if ! gem list | grep 'neovim'; then
	sudo gem install neovim
fi

echo "installing all plugins"

nvim -c "PlugInstall | qa"
nvim -c "CocInstall coc-tabnine | qa"
echo "finished installing paperbenni's neovim config"
