#!/usr/bin/env bash

echo "installing paperbenni's neovim config"
echo "warning, this will override existing configs"

checkcommand() {
    if ! command -v "$1"; then
        echo "$1 not found, please install"
        sleep 2
    fi
}

installcoc() {
    COCLIST="$COCLIST coc-$1"
}

checkcommand npm
checkcommand node
checkcommand pip

if ! [ -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
    echo "Installing vim-plug"
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

cd || exit 1
rm -rf .config/nvim
mkdir .config/nvim

echo "installing config files"
RAWHUB="https://raw.githubusercontent.com/paperbenni/nvim/master"

curl -s $RAWHUB/init.vim >.config/nvim/init.vim
curl -s $RAWHUB/coc-settings.json >.config/nvim/coc-settings.json

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

installcoc tabnine
installcoc marketplace
installcoc sh
installcoc vimlsp
installcoc diagnostic
installcoc clangd
installcoc python
installcoc json
installcoc explorer
installcoc markdownlint
installcoc html
installcoc highlight
installcoc snippets

nvim -c "CocInstall $COCLIST"

echo "finished installing paperbenni's neovim config"
