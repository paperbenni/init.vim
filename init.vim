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
  Plug 'tpope/vim-fugitive'
  Plug 'shougo/denite.nvim'
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
  Plug 'pangloss/vim-javascript'
  Plug 'sbdchd/neoformat'
  Plug 'neomake/neomake'
  Plug 'floobits/floobits-neovim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'airblade/vim-gitgutter'
  Plug 'ryanoasis/vim-devicons'
  Plug 'mattn/gist-vim'
  Plug 'ap/vim-css-color'
  Plug 'icymind/NeoSolarized'
  Plug 'mattn/emmet-vim'
  Plug 'kien/ctrlp.vim'
  Plug 'scrooloose/nerdtree'

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

if has('unix')
  Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
endif

call plug#end()

let g:gitgutter_grep=''
let g:gitgutter_max_signs = 500  
call neomake#configure#automake('w')


let g:deoplete#enable_at_startup = 1
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

colorscheme NeoSolarized

set number
set termguicolors
set numberwidth=4  
set incsearch
set ignorecase
set smartcase
set gdefault
set foldenable          " enable folding
set foldlevelstart=10
set foldnestmax=10      " 10 nested fold max

    set fillchars=vert:┃ 
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
set lazyredraw
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set synmaxcol=128
set background=dark
syntax sync minlines=256
if has('win32')
   let g:python2_host_prog='C:\Users\benja\Envs\nvim2\Scripts\python.exe'
   let g:python3_host_prog='C:\Users\benja\Envs\nvim3\Scripts\python.exe'
endif

cd ~/workspace


function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

tnoremap <Esc> <C-\><C-n>

if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif


