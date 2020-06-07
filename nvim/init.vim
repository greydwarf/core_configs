" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'rhysd/vim-clang-format'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'

Plug 'preservim/nerdcommenter'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/a.vim'

" Better than ctrl-P
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" Snippets
Plug 'honza/vim-snippets'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color schemes
Plug 'sjl/badwolf'
Plug 'vim-scripts/desert256.vim'
Plug 'vim-scripts/wombat256.vim'
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'w0ng/vim-hybrid'
Plug 'tpope/vim-vividchalk'
Plug 'lokaltog/vim-distinguished'
Plug 'marcopaganini/termschool-vim-theme'
Plug 'carakan/new-railscasts-theme'
call plug#end()

color jellybeans
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Change cursor on insert mode
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
\ if v:insertmode == 'i' |
\   silent execute '!echo -ne "\e[6 q"' | redraw! |
\ elseif v:insertmode == 'r' |
\   silent execute '!echo -ne "\e[4 q"' | redraw! |
\ endif
au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set smarttab

set nrformats-=octal
set shiftround

set incsearch
if maparg('<C-N>', 'n') ==# ''
  nnoremap <silent> <C-N> :nohlsearch<CR>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif

set autoread
set fileformats+=mac

if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>
nnoremap & :&&<CR>
xnoremap & :&&<CR>
" Make Y consistent with C and D.  See :help Y.
nnoremap Y y$

set cinoptions=(0,ks,g0
nmap <silent> <leader>sv :so ~/.vimrc<CR>
set hidden
set nowrap
set tabstop=8 shiftwidth=3
set copyindent
set ignorecase smartcase
set hlsearch
set history=1000 undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*/.hg,*/.svn,*/.git,*/venv
set visualbell noerrorbells
set nobackup noswapfile
set scrolloff=4
set wildmode=list:full
set guioptions=bamgirL
set guifont=Liberation\ Mono\ 11

colorscheme wombat256mod
autocmd filetype python set expandtab
nmap <leader>li :set invlist
set pastetoggle=<F2>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set modeline
set shortmess=atI
set expandtab

set nolazyredraw
set nobackup
set nowb
set noswapfile
set autochdir
set noerrorbells
set nostartofline
set number numberwidth=5
set report=0
"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
set softtabstop=3

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" Key mappings
nnoremap <F9> :set guifont=Liberation\ Mono\ 11<CR>
nnoremap <F10> :set guifont=Liberation\ Mono\ 14<CR>
nnoremap <F11> :set guifont=Liberation\ Mono\ 16<CR>

" fzf options
nnoremap <silent> <C-p>     :GFiles<CR>
nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>j :BTags<CR>
nnoremap <silent> <leader>t :Tags<CR>

" ALE
let g:ale_c_parse_compile_commands = 1

" NERD comment
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" A.vim (alternate)
nnoremap <silent> <leader>a :A<CR>

"Ultisnips (make it work with YouCompleteMe)
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
