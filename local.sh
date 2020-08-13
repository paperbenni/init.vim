#!/bin/bash

echo "testing stuff"
cat ./init.vim> ~/.config/nvim/init.vim
nvim -c "PlugInstall | qa"
