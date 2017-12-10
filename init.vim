

call plug#begin('~/.local/share/nvim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'dracula/vim'
  Plug 'joshdick/onedark.vim'
call plug#end()
let g:deoplete#enable_at_startup = 1
let g:airline_theme='onedark'
colorscheme onedark
set number
set numberwidth=4  

