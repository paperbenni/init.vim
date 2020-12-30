#!/usr/bin/env bash
# Install paperbenni's Neovim.
COCLIST="${COCLIST:-}"
NVIMCMD=${nvimcmd:-nvim} 
CURLCMD=${curlcmd:-curl}

install_plugins() {
    echo "installing all plugins"

    $NVIMCMD -c "PlugInstall | qa"

    if 
        grep -i memtotal /proc/meminfo |
            grep -o '[0-9]*' |
            grep -Eq '[0-9]{7,}' &&
        ! command -v termux-setup-storage
    then
        $NVIMCMD -c "TSInstall all | qa"
        COCLIST="$COCLIST tabnine"
    else
        echo "skipping heavy stuff"
    fi

    $NVIMCMD -c "CoCInstall ${COCLIST:-} $(echo '
       marketplace
       sh
       vimlsp
       diagnostic
       clangd
       python
       json
       java
       explorer
       markdownlint
       html
       flutter
       highlight
       snippets
       java
    ' | tr '\n' ' ')"
}

install_plug() {
    if ! [ -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
        echo "Installing vim-plug"
        $CURLCMD -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
}

checkcommand() {
    if ! command -v "$1"; then
        echo "$1 not found, please install" 1>&2
        exit 1
    fi
}

check_nix_install() {
    if ! command -v nix-env; then return 1; fi

    if ! command -v pip2 && ! python2 -c "import neovim"; then
        nix-env -i -E 'f: with import <nixpkgs> { }; (python2.withPackages(ps: [ ps.pynvim ] ))'
    fi
    if ! command -v pip3 && ! python3 -c "import neovim"; then
        nix-env -i -E 'f: with import <nixpkgs> { }; (python3.withPackages(ps: [ ps.pynvim ] ))'
    fi
    if ! command -v $NVIMCMD; then
        nix-env -i neovim
    fi
    if ! command -v npm; then
        nix-env -i nodejs
    fi
    if ! command -v $CURLCMD; then
        nix-env -i curl
    fi
}

check_dependencies() {
    checkcommand $CURLCMD
    checkcommand npm
    checkcommand node
}

backup_config() {
    cd || exit 1
    mv .config/nvim .config/$(date '+%y%m%d%H%M%S')_nvim_backup 2>/dev/null
    mkdir -p .config/nvim
}

install_cfg_files() {
    echo "installing config files"
    RAWHUB="https://raw.githubusercontent.com/paperbenni/nvim/master"

    $CURLCMD -s "$RAWHUB/init.vim" >.config/nvim/init.vim
    $CURLCMD -s "$RAWHUB/coc-settings.json" >.config/nvim/coc-settings.json
}

install_providers() {
    echo "installing neovim providers"
    for x in 2 3; do
        if ! python$x -c "import neovim"; then
            sudo pip$x install neovim pynvim
        fi
    done
    if ! command -v nvim; then
        if ! npm list -g | grep 'neovim'; then
            sudo npm install -g neovim
        fi
        if ! gem list | grep 'neovim'; then
            sudo gem install neovim
        fi
    fi
}

main() {
    echo "installing paperbenni's neovim config"
    echo "warning, this will override existing configs"

    # Keep what this function does distribution agnostic!

    backup_config
    install_plug
    install_cfg_files
    install_plugins

    echo "finished installing paperbenni's neovim config"
}


if [ "$0" = "$BASH_SOURCE" ]; then
    check_nix_install
    check_dependencies
    install_providers
    main "$@"
fi

