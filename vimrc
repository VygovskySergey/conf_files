set nocompatible " be iMproved

" For vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Dependencies of snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"

" Git tools
" Bundle 'tpope/vim-fugitive'
" Dependency managment
Bundle 'gmarik/vundle'
" Rails :/
Bundle 'tpope/vim-rails.git'
" Snippets for our use :)
Bundle 'garbas/vim-snipmate'
" Commenting and uncommenting stuff
Bundle 'tomtom/tcomment_vim'
" Vim Ruby
Bundle 'vim-ruby/vim-ruby'
" Surround your code :)
Bundle 'tpope/vim-surround'
" Every one should have a pair (Autogenerate pairs for "{[( )
Bundle 'jiangmiao/auto-pairs'
" Tab completions
Bundle 'ervandew/supertab'
" Fuzzy finder for vim (CTRL+P)
Bundle 'kien/ctrlp.vim'
" For tests
Bundle 'janko-m/vim-test'
" Navigation tree
Bundle 'scrooloose/nerdtree'
" Dispatching the test runner to tmux pane
Bundle 'tpope/vim-dispatch'
Bundle 'plasticboy/vim-markdown'
" Common clipboard
Bundle 'tmux-plugins/vim-tmux-focus-events'
" Palenight Theme
Bundle 'drewtempelmeyer/palenight.vim'
" Lightline
Plugin 'itchyny/lightline.vim'
" Dash 
Plugin 'rizzatti/dash.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'mattn/emmet-vim'
" Fzf finder
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Slim
Plugin 'slim-template/vim-slim.git'
" Typescript
Plugin 'tasn/vim-tsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
" Dracual theme
Plugin 'dracula/vim', { 'name': 'dracula' }

let g:prettier#autoformat = 0
set tags=./tags; " Set tags directory
set autoindent " Auto indention should be on
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

filetype plugin indent on

" Ruby stuff: Thanks Ben :)
" ================
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
	" Clear old autocmds in group
	autocmd!
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,eruby,yaml,markdown,html set ai sw=2 sts=2 et
	autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab

augroup END
" ================
" Theme
 syntax enable
" for vim 7
 set t_Co=256

 if (has("termguicolors"))
  set termguicolors
 endif

" colorscheme solarized
colorscheme OceanicNext
" Syntax highlighting and theme
" syntax enable
"
" " set background=dark
" set background=light
" set t_Co=256
" let g:lightline = { 'colorscheme': 'palenight' }
"
" colorscheme palenight

set laststatus=2

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" Lovely linenumbers
set nu

" My leader key
let mapleader=","

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Buffer switching
map <leader>p :bp<CR> " \p previous buffer
map <leader>n :bn<CR> " \n next buffer
map <leader>d :bd<CR> " \d delete buffer
" CtrlP in Buffers
nmap <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|tmp'

map <Leader>c :call <CR>
nmap <silent> <leader>c :TestFile<CR>
nmap <silent> <leader>s :TestNearest<CR>
map <leader>t :A<CR> " \t to jump to test file
map <leader>r :r<cr> " \t to jump to related file

set laststatus=2

" Don't be a noob, join the no arrows key movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Removing escape
ino jj <esc>
cno jj <c-c>
vno v <esc>

" highlight the current line
set cursorline
" Highlight active column
set cuc cul"

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
""""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
	:silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
	:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" Show hidden files in NerdTree
let NERDTreeShowHidden=1

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
	" undofile - This allows you to use undos after exiting and restarting
	" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
	" :help undo-persistence
	" This is only present in 7.3+
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif

" Ruby hash syntax conversion
nnoremap <F12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<return>

map <leader>q :NERDTreeToggle<CR>

set clipboard=unnamed

if has('nvim')
  let test#strategy = "neovim"
else
  let test#strategy = "dispatch"
endif

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

if executable('rg')
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
endif
set backspace=indent,eol,start
set rtp+=/usr/local/opt/fzf

" open rg /+f
nnoremap <silent> <Leader>f :Rg<CR>
