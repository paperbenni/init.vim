
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
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
  Plug 'pangloss/vim-javascript'
  Plug 'sbdchd/neoformat'
  Plug 'neomake/neomake'

call plug#end()

call neomake#configure#automake('w')

let g:deoplete#enable_at_startup = 1
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

colorscheme onedark

set number
set numberwidth=4  
set incsearch
set smartcase
set foldenable          " enable folding
set foldlevelstart=10
set foldnestmax=10      " 10 nested fold max
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

if has('win32')
   let g:python2_host_prog='C:\Users\benja\Envs\nvim2\Scripts\python.exe'
   let g:python3_host_prog='C:\Users\benja\Envs\nvim3\Scripts\python.exe'
endif

cd ~/workspace

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif


