
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
  Plug 'joshdick/onedark.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'kien/ctrlp.vim'
  Plug 'tpope/vim-fugitive'
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
colorscheme onedark
set number
set numberwidth=4  
if has('win32')
   let g:python2_host_prog='C:\Users\benja\Envs\nvim2\Scripts\python.exe'
   let g:python3_host_prog='C:\Users\benja\Envs\nvim3\Scripts\python.exe'
endif

cd ~/workspace
