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
set grepprg=pt\ --nogroup\ --nocolor\ --smart-case
set hlsearch
set ignorecase
set laststatus=2
set lazyredraw
set list
set listchars=tab:^\ ,trail:-
set noswapfile
set nowrap
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
nnoremap / /\v
nnoremap ,g :silent<Space>grep!<Space><Space>\|<Space>redraw!<S-Left><S-Left><Left>
nnoremap ,v :vimgrep<Space>/\c/j<Space><S-Left><Right>
nnoremap Q <Nop>

" autocmd
autocmd BufAdd * setlocal bufhidden=delete
autocmd FileType css        setlocal shiftwidth=2 tabstop=2
autocmd FileType html       setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType json       setlocal shiftwidth=2 tabstop=2
autocmd FileType vim        setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml       setlocal shiftwidth=2 tabstop=2
autocmd FileType go         setlocal noexpandtab
autocmd QuickfixCmdPost grep,vimgrep cwindow

" plugin options
let g:ctrlp_match_func={'match': 'pymatcher#PyMatch'}
" let g:ctrlp_use_caching=0
let g:ctrlp_user_command='files -A %s'
let g:formatterpath = ['~/.vim/pack/plugins/start/vim-autoformat/formatprograms/node_modules/.bin']
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" syntax
colorscheme lucius
syntax enable

" filetype
filetype plugin indent on
