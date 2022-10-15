" paperbenni's vimrc
" requires nvim-git

set number
set mouse=a
let mapleader = " "
map <SPACE> <leader>

call plug#begin('~/.vim/plugged')
    " essential stuff
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-dadbod'
    Plug 'kristijanhusak/vim-dadbod-ui'
    Plug 'tpope/vim-dispatch'
    Plug 'junegunn/fzf.vim'
    Plug 'mattn/emmet-vim'
    Plug 'catppuccin/nvim', {'as': 'catppuccin'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-eunuch'
    Plug 'joshdick/onedark.vim'
    Plug 'morhetz/gruvbox'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
    Plug 'akinsho/bufferline.nvim'

    Plug 'hoob3rt/lualine.nvim'
    Plug 'tpope/vim-surround'
    Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
    Plug 'paperbenni/Calendar.vim'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-commentary'
    Plug 'paperbenni/vimwiki', { 'branch': 'dev' }
    Plug 'mhinz/vim-startify'
    Plug 'honza/vim-snippets'
    Plug 'michal-h21/vim-zettel'
    Plug 'lervag/vimtex'

    " stuff not included in lightweight installs
    " HEAVYBEGIN #TODO make this an imosid section
    Plug 'Yggdroot/indentLine'
    Plug 'machakann/vim-highlightedyank'
    Plug 'airblade/vim-gitgutter'
    Plug 'folke/which-key.nvim'
    Plug 'rhysd/vim-grammarous'
    Plug 'psliwka/vim-smoothie'
    Plug 'puremourning/vimspector'
    Plug 'dbeniamine/cheat.sh-vim', { 'on': 'Cheat' }
    Plug 'preservim/tagbar', { 'on': 'Tagbar' }
    Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
    " HEAVYEND

    " experimental stuff
    Plug 'szw/vim-maximizer', { 'on': 'MaximizerToggle' }
    Plug 'kassio/neoterm'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/vim-easy-align'
call plug#end()


  
  function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  endfunction
  
  function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
  endfunction

let g:vimwiki_markdown_link_ext=0

let g:netrw_liststyle=3
" animated cursor in neovide GUI
let g:neovide_cursor_vfx_mode = "sonicboom"

let g:zettel_format = "%y%m%d-%H%M-%title"



let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-lualatex',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}

set showtabline=2
set lazyredraw

let g:netrw_banner = 0

set list lcs=tab:\|\ 

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:tex_flavor = 'latex'

let wiki = {}
let wiki.path = '~/wiki/vimwiki'
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let wiki.automatic_nested_syntaxes = 1

let streamwiki = {}
let streamwiki.path = '~/streamwiki/vimwiki'
let streamwiki.automatic_nested_syntaxes = 1


let g:vimwiki_conceal_pre = 1
let g:vimwiki_list = [wiki, streamwiki] " wikilistmarker


let $FZF_DEFAULT_OPTS='--reverse --color=dark --color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef'

" somehow works in tmux now...
if has("termguicolors")
        set termguicolors
endif

syntax on


colorscheme onedark
set hidden

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set inccommand=split

command! -bang ProjectFiles call fzf#vim#files('~/workspace', <bang>0)

nnoremap <leader><SPACE> :Files<CR>
nnoremap <leader>a :Startify<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>C gg0VG"+y<CR>
nnoremap <leader>c :call CocAction('pickColor')<CR>
nnoremap <leader>d :cd %:p:h<CR>
nnoremap <leader>e :CocCommand explorer<CR>
nnoremap <leader>F :CocSearch -S 
nnoremap <leader>g :Gcd<CR>
nnoremap <leader>h :GitGutterPreviewHunk<CR>
nnoremap <leader>f :w<CR>
nnoremap <leader>o :ProjectFiles<CR>
nnoremap <leader>t :belowright Ttoggle<CR>
nnoremap <leader>l :Rg<CR>
nnoremap <leader>L :Lines<CR>
nnoremap <leader>r :Tags<CR>
nnoremap <leader>s :G<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>p :vsplit<CR> \| :terminal git push<CR>i
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>N :Neoformat<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <leader>k :call <SID>show_documentation()<CR>
nnoremap <leader>x :T 
nnoremap <leader>z :Goyo<CR>


nnoremap <leader>. :bn<CR>
nnoremap <leader>, :bp<CR>

nmap <leader><tab> <plug>(fzf-maps-n)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

command! Lighttheme colorscheme gruvbox | set background=light

if exists(':lua')
    lua << EOF
    require('lualine').setup{ options = { theme = 'onedark', icons_enabled = true }}
    require'bufferline'.setup{}
    require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
EOF

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
xmap <leader>y  <Plug>(coc-format-selected)
nmap <leader>y  <Plug>(coc-format-selected)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif



inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <C-l>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" add the txt: prefix for non-md plain text files that should be opened in vim
" instead of xdg-open
function! VimwikiLinkHandler(link)
  if a:link =~# '^txt:'
    try
      " chop off the leading file: - see :h expr-[:] for syntax:
      execute ':split ' . a:link[4:]
      return 1
    catch
      echo "Failed opening file in vim."
    endtry
  endif
  return 0
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

