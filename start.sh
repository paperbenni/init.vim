#!/bin/bash

cd ~/.local/share/nvim/site/autoload || mkdir -p ~/.local/share/nvim/site/autoload

if [ ! -f ./plug.vim ]
then
        curl -o plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


