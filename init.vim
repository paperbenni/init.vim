" paperbenni's vimrc
" requires nvim-git

set number
set mouse=a

call plug#begin('~/.vim/plugged')
    " essential stuff
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-eunuch'
    Plug 'xolox/vim-misc'
    Plug 'joshdick/onedark.vim'
    if has('lua')
        Plug 'nvim-lua/popup.nvim'
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim', { 'on': 'Telescope' }
        Plug 'nvim-treesitter/nvim-treesitter'
    endif
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-surround'
    Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-commentary'
    Plug 'honza/vim-snippets'
    " experimental stuff
    Plug 'ryanoasis/vim-devicons'
    Plug 'szw/vim-maximizer', { 'on': 'MaximizerToggle' }
    Plug 'dbeniamine/cheat.sh-vim', { 'on': 'Cheat' }
    Plug 'kassio/neoterm', { 'on': 'Ttoggle' }
    Plug 'rhysd/vim-grammarous'
    Plug 'preservim/tagbar', { 'on': 'Tagbar' }
    Plug 'mhinz/vim-startify'
    Plug 'xolox/vim-notes'
    Plug 'machakann/vim-highlightedyank'
    Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
    Plug 'jiangmiao/auto-pairs'
    Plug 'psliwka/vim-smoothie'
    Plug 'vim-airline/vim-airline'
    Plug 'lervag/vimtex'
call plug#end()


let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:netrw_liststyle=3
let g:netrw_banner = 0

set list lcs=tab:\|\ 

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:tex_flavor = 'latex'

let $FZF_DEFAULT_OPTS='--reverse --color=dark --color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef'

" somehow works in tmux now...
if has("termguicolors")
        set termguicolors
endif

syntax on


colorscheme onedark
map <SPACE> <leader>
set hidden

set inccommand=split

command! -bang ProjectFiles call fzf#vim#files('~/workspace', <bang>0)

nnoremap <leader><SPACE> :Files<CR>
nnoremap <leader>a :Startify<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :call CocAction('pickColor')<CR>
nnoremap <leader>d :cd %:p:h<CR>
nnoremap <leader>e :CocCommand explorer<CR>
nnoremap <leader>F :CocSearch -S 
nnoremap <leader>g :Gcd<CR>
nnoremap <leader>h :GitGutterPreviewHunk<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>o :ProjectFiles<CR>
nnoremap <leader>l :Telescope live_grep<CR>
nnoremap <leader>L :Lines<CR>
nnoremap <leader>r :Tags<CR>
nnoremap <leader>s :G<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>p :vsplit<CR> \| :terminal git push<CR>i
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>N :Neoformat<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <leader>k :call <SID>show_documentation()<CR>
nnoremap <leader>z :Goyo<CR>

nnoremap <leader>. :bn<CR>
nnoremap <leader>, :bp<CR>

nmap <leader><tab> <plug>(fzf-maps-n)

if has('lua')
    lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
endif


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

set foldmethod=indent
set nofoldenable

nmap <leader>i  <Plug>(coc-format)
nmap <leader><F2> <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <C-l>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


set tabstop=4 shiftwidth=4 expandtab

" additional mode switching

inoremap <special> kj <ESC> 
inoremap <special> jk <ESC>:
tnoremap <special> jk <C-\><C-n>

set tabline
set cursorline
set relativenumber
set smartcase
set ignorecase
set scrolloff=6

set guifont=FiraCode\ Nerd\ Font\ Mono:h13
set encoding=UTF-8

