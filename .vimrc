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
set grepprg=pt\ --nogroup\ --nocolor
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
nnoremap # #N
nnoremap * *N
nnoremap <C-]> g<C-]>
nnoremap <Space>g :silent<Space>grep!<Space>
nnoremap <Space>v :vimgrep<Space>/\c/j<Space><S-Left><Right>
nnoremap Q <Nop>
nnoremap g# g#N
nnoremap g* g*N

" autocmd
autocmd BufAdd * setlocal bufhidden=delete
autocmd FileType css        setlocal shiftwidth=2 tabstop=2
autocmd FileType haml       setlocal shiftwidth=2 tabstop=2
autocmd FileType html       setlocal shiftwidth=2 tabstop=2
autocmd FileType jade       setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType json       setlocal shiftwidth=2 tabstop=2
autocmd FileType jsx        setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby       setlocal shiftwidth=2 tabstop=2
autocmd FileType scala      setlocal shiftwidth=2 tabstop=2
autocmd FileType vim        setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml       setlocal shiftwidth=2 tabstop=2
autocmd QuickfixCmdPost grep,vimgrep cw

" plugins
set runtimepath+=~/.vim/plugins/YouCompleteMe
set runtimepath+=~/.vim/plugins/ctrlp-py-matcher
set runtimepath+=~/.vim/plugins/ctrlp.vim
set runtimepath+=~/.vim/plugins/tern_for_vim,~/.vim/plugins/tern_for_vim/after
set runtimepath+=~/.vim/plugins/vim-alignta
set runtimepath+=~/.vim/plugins/vim-autoformat
set runtimepath+=~/.vim/plugins/vim-go
set runtimepath+=~/.vim/plugins/vim-jade
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
