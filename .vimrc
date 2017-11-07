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
nnoremap <Space>g :silent<Space>grep!<Space><Space>\|<Space>redraw!<S-Left><S-Left><Left>
nnoremap <Space>v :vimgrep<Space>/\c/j<Space><S-Left><Right>
nnoremap <Space>h  ^
nnoremap <Space>l  $
nnoremap Q <Nop>

" autocmd
augroup grp
  autocmd!
  autocmd BufAdd * setlocal bufhidden=delete
  autocmd FileType css        setlocal shiftwidth=2 tabstop=2
  autocmd FileType html       setlocal shiftwidth=2 tabstop=2
  autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
  autocmd FileType json       setlocal shiftwidth=2 tabstop=2
  autocmd FileType vim        setlocal shiftwidth=2 tabstop=2
  autocmd FileType yaml       setlocal shiftwidth=2 tabstop=2
  autocmd FileType go         setlocal noexpandtab
  autocmd QuickfixCmdPost grep,vimgrep cwindow
augroup END

" plugin options
let g:ctrlp_match_func = {'match': 'pymatcher#PyMatch'}
let g:ctrlp_user_command = 'files -A %s'
" let g:ctrlp_use_caching = 0
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp_cache'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 1
" let g:formatterpath = ['']
inoremap <expr> <Tab>   pumvisible() ? '<C-n>'     : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '<C-p>'     : '<S-Tab>'
inoremap <expr> <cr>    pumvisible() ? '<C-y><cr>' : '<cr>'

" syntax
colorscheme lucius
syntax enable

" filetype
filetype plugin indent on

" plugin install command
function! PluginInstall()
  let repos = [
        \'https://github.com/FelikZ/ctrlp-py-matcher.git',
        \'https://github.com/ctrlpvim/ctrlp.vim.git',
        \'https://github.com/fatih/vim-go.git',
        \'https://github.com/h1mesuke/vim-alignta.git',
        \'https://github.com/jonathanfilip/vim-lucius.git',
        \'https://github.com/maralla/completor.vim.git',
        \'https://github.com/othree/yajs.vim.git',
        \'https://github.com/Chiel92/vim-autoformat.git',
        \]
  if has('win32') || has('win64')
    let dir = $HOME . '\vimfiles\pack\a\start\'
  else
    let dir = $HOME . '/.vim/pack/a/start/'
  endif
  for repo in repos
    let name = substitute(fnamemodify(repo, ":t"), '.git', '', '')
    let path = dir . name
    if isdirectory(path)
      echo 'Update ' . name . ': ' . system('git -C ' . path . ' pull')
    else
      echo 'Download ' . name . ': ' . system('git clone ' . repo . ' ' . path)
    endif
  endfor
endfunction
command! PluginInstall call PluginInstall()
