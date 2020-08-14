" paperbenni's vimrc

set number
set mouse=a

call plug#begin('~/.vim/plugged')
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'joshdick/onedark.vim'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	Plug 'junegunn/fzf.vim'
call plug#end()

" somehow works in tmux now...
if has("termguicolors")
        set termguicolors
endif

syntax on

tnoremap <Esc> <C-\><C-n>

colorscheme onedark
map <SPACE> <leader>
set hidden

set inccommand=split

command! -bang ProjectFiles call fzf#vim#files('~/workspace', <bang>0)

nnoremap <leader><SPACE> :Files<CR>

nnoremap <leader>w :ProjectFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :Gcd<CR>
nnoremap <leader>s :G<CR>
nnoremap <leader>e :CocCommand explorer<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>p :terminal git push<CR>i
nnoremap <leader>n :tabnew<CR>

set foldmethod=indent
set nofoldenable

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

set tabstop=4
set expandtab

