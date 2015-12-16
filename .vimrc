" encoding
set encoding=utf-8
scriptencoding utf-8

" options
set ambiwidth=double
set autoindent
set background=dark
set cursorline
set expandtab
set fileformats=unix,dos,mac
set grepprg=pt\ --nogroup
set hlsearch
set ignorecase
set laststatus=2
set lazyredraw
set list
set listchars=tab:^\ ,trail:-
set noswapfile
set nowrapscan
set number
set scroll=5
set scrolloff=5
set shiftwidth=4
set showcmd
set showmatch
set sidescroll=1
set sidescrolloff=10
set smartcase
set smarttab
set splitbelow
set splitright
set statusline=%f\ %h%m%r%w%=%{&fileformat}\ %{&fileencoding}\ %{&filetype}%4p%%%6l:%-4.(%c%)
set t_Co=256
set tabstop=4
set ttyfast
set wildmode=list:longest

" map
nnoremap <Space>g :silent<Space>grep!<Space>
nnoremap <Space>v :vimgrep<Space>/\c/j<Space><S-Left><Right>
nnoremap Q <Nop>
noremap # #N
noremap * *N
noremap g# g#N
noremap g* g*N

" autocmd
autocmd BufAdd * setlocal bufhidden=delete
autocmd QuickfixCmdPost grep,vimgrep cw

" plugins
set runtimepath+=~/.vim/plugins/YouCompleteMe
set runtimepath+=~/.vim/plugins/ctrlp-py-matcher
set runtimepath+=~/.vim/plugins/ctrlp.vim
set runtimepath+=~/.vim/plugins/vim-alignta
set runtimepath+=~/.vim/plugins/vim-go
set runtimepath+=~/.vim/plugins/vim-javascript
set runtimepath+=~/.vim/plugins/vim-lucius
set runtimepath+=~/.vim/plugins/vim-remove-trailing-space
set runtimepath+=~/.vim/plugins/vim-wipeout-noncurrent-buffers

" plugin options
let g:ctrlp_match_func={'match': 'pymatcher#PyMatch'}
let g:ctrlp_use_caching=0
let g:ctrlp_user_command='files -A %s'

" syntax
colorscheme lucius
syntax enable

" filetype
filetype plugin indent on
