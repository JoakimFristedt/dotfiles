set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'pearofducks/solarized-powerlines'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ervandew/supertab'
Plugin 'kburdett/vim-nuuid'
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
call vundle#end()
set nocompatible
filetype plugin indent on
filetype off
syntax on

set undodir=$HOME/.vim/undos
set undofile " new feature of undo files

set directory=$HOME/.vim/swap " no more swapfiles in the same directory
set backupdir=$HOME/.vim/backups " no more backupfiles in the same directory
set backupskip=/tmp/*,/private/tmp/* " http://vim.wikia.com/wiki/Editing_crontab
set backup

set splitbelow
set splitright
set tabstop=4
set shiftwidth=4
set expandtab
set visualbell " no beep but visual bell
"set cursorline " Highlight the screen line of the cursor
set ttyfast " Indicates a fast terminal connection.
set ruler " Show the line and column number of the cursor position
set laststatus=2 " = always
set hlsearch
set ignorecase " case-sensitive search intelligently
set smartcase " all lower -> insensitive, on upper case -> sensitive

" searches use normal regexes
nnoremap / /\v
vnoremap / /\v

autocmd VimEnter * wincmd w
autocmd BufEnter * silent! lcd %:p:h
autocmd VimEnter * NERDTree
autocmd BufWinEnter * NERDTreeMirror

" Stifle many interruptive "Hit Enter" prompts
set shortmess=atI
set t_Co=256

let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_visibility="high"
let g:solarized_contrast="high"
colorscheme solarized
set background=dark
let g:airline_theme='solarized'

set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set clipboard=unnamedplus
set backspace=indent,eol,start
set number
let python_highlight_all=1
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

" Leader=Space
let mapleader=" "
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>W <Plug>(easymotion-bd-w)
nmap <Leader>W <Plug>(easymotion-overwin-w)

" Fuzzy search change / to z/ for default
map / <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" fuzzy-search with EasyMotion
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

let g:SuperTabMappingForward = '<nul>'
let g:SuperTabMappingBackward = '<s-nul>'
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap <S-Tab> <C-d>

nmap <silent> <C-T> :NERDTreeToggle<CR>

" Quit vim
nmap <leader>q :q<CR>
" Quit all vim
nmap <leader>Q :qa<CR>

" Toggle folds
nmap <leader>+ zo
nmap <leader>- zc

" Tab movements
nmap <leader>l :tabnext<CR>
nmap <leader>h :tabprevious<CR>

" Faster exit
nmap <leader>w :w<CR>

" Toggle invisible chars
map <leader>tl :set list!<CR>

" Escape shortcut
inoremap jj <ESC>

