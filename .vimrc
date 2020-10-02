"-------------------------------------------------------------------------------
" encoding
"-------------------------------------------------------------------------------

set encoding=utf-8
scriptencoding utf-8

"-------------------------------------------------------------------------------
" options
"-------------------------------------------------------------------------------

set ambiwidth=double
set autoindent
set background=dark
set belloff=all
set clipboard+=unnamed
set cursorline
set expandtab
set fileformats=unix,dos,mac
set hlsearch
set ignorecase
set laststatus=2
set lazyredraw
set list
set listchars=tab:^\ ,trail:-
set mouse=
set noswapfile
set nowrap
set nowrapscan
set nrformats-=octal
set number
set pastetoggle=<leader>p
set scroll=5
set scrolloff=5
set shellslash
set shiftwidth=0
set showcmd
set showmatch
set sidescroll=1
set sidescrolloff=10
set signcolumn=yes
set smartcase
set smarttab
set softtabstop=-1
set splitbelow
set splitright
set statusline=%f\ %h%m%r%w%=%{&fileformat}\ %{&fileencoding}\ %{&filetype}%4p%%%6l:%-4.(%c%)
set synmaxcol=500
set tabstop=4
set termguicolors
set ttyfast
set updatetime=100
"set viminfo=
set wildmode=longest,list
set hidden
set showtabline=2

if has('gui_running')
  set guioptions=
  if has('mac')
    set guifont=SFMono-Regular:h14
    set guifontwide=Osaka-Mono:h14
  endif
  if has('win64')
    set guifont=Consolas:h13
    set guifontwide=源真ゴシック等幅_Normal:h13
    set renderoptions=type:directx,renmode:5
  endif
endif

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif

" let g:gruvbox_italic=1
" colorscheme japanesque
" colorscheme lucius
" colorscheme gruvbox8
" colorscheme xcodedark
" colorscheme morning
" colorscheme fogbell_light
colorscheme PaperColor
filetype plugin indent on
syntax enable

"-------------------------------------------------------------------------------
" disable builtin features
"-------------------------------------------------------------------------------

let g:no_gvimrc_example         = 1
let g:no_vimrc_example          = 1
let g:loaded_gzip               = 1
let g:loaded_tar                = 1
let g:loaded_tarPlugin          = 1
let g:loaded_zip                = 1
let g:loaded_zipPlugin          = 1
let g:loaded_rrhelper           = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
let g:loaded_netrw              = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_netrwSettings      = 1
let g:loaded_netrwFileHandlers  = 1
let g:did_install_default_menus = 1
let g:skip_loading_mswin        = 1
let g:did_install_syntax_menu   = 1
let g:loaded_2html_plugin       = 1

"-------------------------------------------------------------------------------
" key mappings
"-------------------------------------------------------------------------------

nnoremap / /\v
nnoremap <leader>g :silent<space>grep!<space><space>\|<space>redraw!<home><s-right><s-right><right>
nnoremap <leader>v :vimgrep<space>/\c/j<space>%<home><s-right><right><right>
command! Q echo 'may be a typo in "q"'
nnoremap <c-g> 1<c-g>
nnoremap <silent> <c-n> :set invnumber<cr>:let &signcolumn = &signcolumn == 'yes' ? 'no' : 'yes'<cr>
nnoremap <silent> <c-j> :bnext<cr>
nnoremap <silent> <c-k> :bprevious<cr>
nnoremap K <nop>

"-------------------------------------------------------------------------------
" options by filetype
"-------------------------------------------------------------------------------

augroup myoptions
  autocmd!
  autocmd FileType css        setlocal tabstop=2 iskeyword+=-
  autocmd FileType html       setlocal tabstop=4 iskeyword+=-
  autocmd FileType javascript setlocal tabstop=2 iskeyword+=-
  autocmd FileType json       setlocal tabstop=2
  autocmd FileType ruby       setlocal tabstop=2
  autocmd FileType vim        setlocal tabstop=2
  autocmd FileType yaml       setlocal tabstop=2
  autocmd FileType vim        setlocal tabstop=2
  autocmd FileType go         setlocal noexpandtab
  "autocmd FileType markdown   setlocal spelllang+=cjk spell
  autocmd BufNewFile,BufRead *.yml.liquid setlocal filetype=yaml
  autocmd BufNewFile,BufRead *.dig setlocal filetype=yaml indentkeys-=<:> indentkeys-=0#
  autocmd BufNewFile,BufRead *.blade.php setlocal filetype=html
augroup END

"-------------------------------------------------------------------------------
" commands
"-------------------------------------------------------------------------------

command! CdCurrent :cd %:h
command! LcdCurrent :lcd %:h

augroup vimrc_autoreload
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
command! Vimrc edit $MYVIMRC

if executable('sqlformat')
  command! -range=% SQLFmt <line1>,<line2>!sqlformat -r -k upper -
endif

if executable('black')
  command! -range=% PythonFmt <line1>,<line2>!black -q  -
endif

"-------------------------------------------------------------------------------
" plugin: CtrlP
"-------------------------------------------------------------------------------

let g:ctrlp_types = ['fil', 'buf']
let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
if executable('rg')
  let g:ctrlp_user_command = 'rg --files %s'
endif
"let g:ctrlp_lazy_update = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_match_window = 'results:50'
let g:ctrlp_prompt_mappings = {
            \   'PrtBS()': ['<c-h>', '<bs>'],
            \   'PrtCurLeft()': ['<left>'],
            \ }
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'

"-------------------------------------------------------------------------------
" plugin: vim-lsp
"-------------------------------------------------------------------------------

setlocal omnifunc=lsp#complete
"nmap <buffer> gd <plug>(lsp-definition)
autocmd BufNewFile,BufReadPost * if &ft !=# 'help' | nmap <buffer> <c-]> <plug>(lsp-definition)

"-------------------------------------------------------------------------------
" plugin: Dirvish
"-------------------------------------------------------------------------------

" function! s:setup_dirvish()
"   nnoremap <buffer> <c-P> :execute(g:ctrlp_cmd)<CR>
"   nnoremap <buffer> <c-n> <nop>
"   nnoremap <buffer>  p <nop>
" endfunction
" augroup DirVish
"   au!
"   autocmd FileType dirvish setlocal buftype=nowrite | :call s:setup_dirvish()
" augroup END

"-------------------------------------------------------------------------------
" plugin: python-syntax
"-------------------------------------------------------------------------------

let g:python_highlight_all = 1

"-------------------------------------------------------------------------------
" plugin: vim-prettier
"-------------------------------------------------------------------------------

let g:prettier#config#print_width = 120

"-------------------------------------------------------------------------------
" plugin: previm
"-------------------------------------------------------------------------------

let g:previm_enable_realtime = 1
let g:previm_open_cmd = 'open -a Google\ Chrome'

"-------------------------------------------------------------------------------
" plugin: vim-osc52
"-------------------------------------------------------------------------------

vnoremap <C-c> y:call SendViaOSC52(getreg('"'))<cr>

"-------------------------------------------------------------------------------
" plugin: vim-molder
"-------------------------------------------------------------------------------

nnoremap - :execute 'edit' expand('%:p:h')<cr>
nnoremap g- :execute 'new' expand('%:p:h')<cr>
nnoremap G- :execute 'vnew' expand('%:p:h')<cr>
let g:molder_ext_buftype = 'nowrite'

"-------------------------------------------------------------------------------
" plugin: vim-today
"-------------------------------------------------------------------------------

nmap <leader>t <plug>(today-open)

"-------------------------------------------------------------------------------
" plugin: vim-maketable
"-------------------------------------------------------------------------------

function! s:remakeTable(bang, ...)
  let l:sep = get(a:000, 0, ',')
  execute ':UnmakeTable' . l:sep
  let l:start = search('^$', 'bcnW')
  let l:end = search('^$', 'ncW')
  let l:start = l:start == 0 ? 1 : l:start + 1
  let l:end = l:end == 0 ? line('$') : l:end - 1
  execute printf(':%d,%dMakeTable%s%s', l:start, l:end, a:bang, l:sep)
endfunction
command! -bang -nargs=? RemakeTable call s:remakeTable('<bang>', <f-args>)

"-------------------------------------------------------------------------------
" plugin: minpac
"-------------------------------------------------------------------------------

function! s:install_minpac() abort
  let l:dir = '~/.vim/pack/minpac/opt/minpac'
  if !isdirectory(expand(l:dir))
      echo system('git clone https://github.com/k-takata/minpac.git'.' '.l:dir)
  endif
endfunction

function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('mattn/ctrlp-matchfuzzy')
  call minpac#add('ctrlpvim/ctrlp.vim')

  call minpac#add('romainl/vim-qf')
  call minpac#add('qpkorr/vim-renamer')

  call minpac#add('h1mesuke/vim-alignta')

  " call minpac#add('mattn/vim-goimports')
  call minpac#add('thinca/vim-quickrun')

  call minpac#add('prabirshrestha/asyncomplete.vim')
  call minpac#add('prabirshrestha/vim-lsp')
  call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
  call minpac#add('mattn/vim-lsp-settings')

  call minpac#add('prettier/vim-prettier', {'do': {-> system('npm install')}})

  call minpac#add('simeji/winresizer')

  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('tpope/vim-fugitive')

  call minpac#add('justinmk/vim-dirvish')
  call minpac#add('mattn/vim-molder')
  call minpac#add('tkhrmd/vim-molder-buftype')
  call minpac#add('tkhrmd/vim-molder-lastpath')
  call minpac#add('mattn/vim-sonictemplate')

  call minpac#add('previm/previm')

  " call minpac#add('mattn/vim-lexiv')

  call minpac#add('mattn/vim-maketable')

  " call minpac#add('joshdick/onedark.vim')
  " call minpac#add('aereal/vim-colors-japanesque')
  call minpac#add('jonathanfilip/vim-lucius')
  " call minpac#add('rakr/vim-one')
  call minpac#add('morhetz/gruvbox')
  " call minpac#add('lifepillar/vim-solarized8')
  " call minpac#add('tyru/caw.vim')
  call minpac#add('chrisbra/matchit')

  " call minpac#add('vim-python/python-syntax')
  " call minpac#add('mhinz/vim-sayonara')

  " call minpac#add('tmux-plugins/vim-tmux-focus-events')
  " call minpac#add('roxma/vim-tmux-clipboard')
  " call minpac#add('koron/vim-monochromenote')
  " call minpac#add('yasukotelin/shirotelin')
  " call minpac#add('nathanaelkane/vim-indent-guides')

  " call minpac#add('alvan/vim-closetag')
  call minpac#add('NLKNguyen/papercolor-theme')
  " call minpac#add('tpope/vim-surround')
  " call minpac#add('machakann/vim-sandwich')
  call minpac#add('jaredgorski/fogbell.vim')
  call minpac#add('mattn/benchvimrc-vim')
  call minpac#add('jonathanfilip/vim-lucius')
  " call minpac#add('vim-scripts/Align')
  call minpac#add('fcpg/vim-osc52')

  call minpac#add('ap/vim-buftabline')

  call minpac#add('tkhrmd/vim-today')

  call minpac#add('arzg/vim-colors-xcode')
  call minpac#add('lifepillar/vim-gruvbox8')
  call minpac#add('vim/colorschemes')

endfunction

command! PackUpdate call s:install_minpac() | source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
