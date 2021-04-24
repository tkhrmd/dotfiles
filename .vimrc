"-------------------------------------------------------------------------------
" encoding
"-------------------------------------------------------------------------------

set encoding=utf-8
scriptencoding utf-8

"-------------------------------------------------------------------------------
" options
"-------------------------------------------------------------------------------

"let mapleader = ","
"let mapleader = "\<space>"

set ambiwidth=double
set smartindent
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
"set scroll=5
set scrolloff=5
set shellslash
set shiftwidth=0
set showcmd
set showmatch
set matchtime=0
set sidescroll=1
set sidescrolloff=10
set signcolumn=yes
set smartcase
set smarttab
set softtabstop=-1
set splitbelow
set splitright
set statusline=%f\ %h%m%r%w%=%{&fileformat}\ %{&fileencoding}\ %{&filetype}%4p%%%6l:%-4.(%c%)
set synmaxcol=200
set tabstop=4
set termguicolors
set timeout
set timeoutlen=3000
set ttimeoutlen=100
set ttyfast
" set updatetime=100
" set viminfo=
set wildmode=longest,list
set hidden
set showtabline=2
set pumheight=10
set backspace=indent,eol,start
set incsearch

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
  set grepprg=rg\ --vimgrep\ --no-heading
endif

filetype plugin indent on
syntax enable

"-------------------------------------------------------------------------------
" disable builtin features
"-------------------------------------------------------------------------------

let g:no_gvimrc_example         = 1
let g:no_vimrc_example          = 1

let g:did_install_default_menus = 1
let g:skip_loading_mswin        = 1
let g:did_install_syntax_menu   = 1
let g:no_plugin_maps            = 1

let g:loaded_2html_plugin       = 1
let g:loaded_dvorak_plugin      = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
let g:loaded_logiPat            = 1
let g:loaded_matchit            = 1
let g:loaded_matchparen         = 1
let g:loaded_netrw              = 1
let g:loaded_netrwFileHandlers  = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_netrwSettings      = 1
"let g:loaded_sql_completion     = 1
"let g:loaded_syntax_completion  = 1
let g:loaded_tar                = 1
let g:loaded_tarPlugin          = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_xmlformat          = 1
let g:loaded_zip                = 1
let g:loaded_zipPlugin          = 1
let loaded_cfilter              = 1
let loaded_gzip                 = 1
let loaded_less                 = 1
let loaded_rrhelper             = 1
let loaded_spellfile_plugin     = 1

"-------------------------------------------------------------------------------
" mappings
"-------------------------------------------------------------------------------

map Q <nop>
nnoremap / /\v
nnoremap ? ?\v
nnoremap <leader>g :silent<space>grep!<space>
nnoremap <leader>v :let &ve = &ve ==# 'all' ? '' : 'all'<cr>:echo 'Virtual editing ' . (&ve ==# 'all' ? 'enabled' : 'disabled')<cr>
nnoremap <c-g> 1<c-g>
nnoremap <silent> <c-j> :bnext<cr>
nnoremap <silent> <c-k> :bprevious<cr>
nnoremap <c-c> :set undoreload=0 <bar> edit<cr>
nnoremap <silent> <c-n> :nohlsearch<cr>
nnoremap <leader>, :edit $MYVIMRC<cr>

"-------------------------------------------------------------------------------
" commands
"-------------------------------------------------------------------------------

command! Q echo 'may be a typo in "q"'
command! CdCurrent :cd %:h
command! LCdCurrent :lcd %:h
command! -range RemoveTrailingWhitespace keeppatterns <line1>,<line2>s/\m\s\+$//

if executable('sqlformat')
  " command! -range=% SQLFmt <line1>,<line2>!sqlformat -r -k upper -
  command! -range=% SQLFmt <line1>,<line2>!sqlformat -r -k lower -i lower -
endif


command! BufOnly for buf in filter(range(1, bufnr('$')), {idx, val -> buflisted(val) && val != bufnr('%') && getbufinfo(val)[0].changed == 0}) |
      \ execute 'bdelete' buf | endfor

command! OpenWithCp932 :edit ++encoding=cp932

"-------------------------------------------------------------------------------
" autocmd
"-------------------------------------------------------------------------------

augroup myautocmd
  autocmd!
  autocmd FileType css        setlocal tabstop=2 iskeyword+=-
  autocmd FileType html       setlocal tabstop=2 iskeyword+=-
  autocmd FileType javascript,javascriptreact setlocal tabstop=2 iskeyword+=-
  autocmd FileType typescript,typescriptreact setlocal tabstop=2 iskeyword+=-
  autocmd FileType json       setlocal tabstop=2
  autocmd FileType ruby       setlocal tabstop=2
  autocmd FileType vim        setlocal tabstop=2
  autocmd FileType yaml       setlocal tabstop=2
  autocmd FileType sh         setlocal tabstop=2
  autocmd FileType go         setlocal noexpandtab
  autocmd FileType markdown   setlocal spelllang+=cjk spell
  autocmd BufNewFile,BufRead *.yml.liquid setlocal filetype=yaml
  autocmd BufNewFile,BufRead *.dig setlocal filetype=yaml indentkeys-=<:> indentkeys-=0#
  autocmd BufNewFile,BufRead *.blade.php setlocal filetype=html
  autocmd BufNewFile,BufRead *.gs setlocal filetype=javascript
  autocmd QuitPre * setlocal bufhidden=delete
  autocmd QuickFixCmdPost grep cwindow | redraw!
  autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(0), '&buftype') == 'quickfix' | quit | endif
augroup END

"-------------------------------------------------------------------------------
" edit vimrc
"-------------------------------------------------------------------------------

augroup myvimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
command! Vimrc edit $MYVIMRC

"-------------------------------------------------------------------------------
" plugin: CtrlP
"-------------------------------------------------------------------------------

let g:ctrlp_types = ['fil']
let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
if executable('rg')
  let g:ctrlp_user_command = 'rg --files %s'
endif
" let g:ctrlp_lazy_update = 1
" let g:ctrlp_use_caching = 1
" let g:ctrlp_clear_cache_on_exit = 0
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

" let g:lsp_diagnostics_highlights_enabled = 0
" let g:lsp_document_highlight_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1

function! s:on_lsp_buffer_enabled() abort
  let g:lsp_format_sync_timeout = 1000

  " efm-langserver 以外の server が有効なときにマッピング
  if len(g:lsp#get_allowed_servers()) > 1
    setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    "nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> <f2> <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    "nmap <silent> <buffer> [g <Plug>(lsp-previous-diagnostic)
    "nmap <silent> <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.py,*.go call execute('LspDocumentFormatSync')
  endif

  command! EfmLangserverFormatSync call execute('LspDocumentFormatSync --server=efm-langserver')
  command! Black call execute('EfmLangserverFormatSync')
  autocmd! BufWritePre *.py Black
  command! Prettier call execute('EfmLangserverFormatSync')
  autocmd! BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.html Prettier

endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" ~/.config/efm-langserver/config.yaml を参照
let g:lsp_settings = {
\   'efm-langserver': {
\       'disabled': v:false,
\   }
\}

"-------------------------------------------------------------------------------
" plugin: previm
"-------------------------------------------------------------------------------

let g:previm_enable_realtime = 1
let g:previm_open_cmd = 'open -a Google\ Chrome'
let g:previm_plantuml_imageprefix = 'http://localhost:8080/img/'

"-------------------------------------------------------------------------------
" plugin: vim-osc52
"-------------------------------------------------------------------------------

vnoremap <C-c> y:call SendViaOSC52(getreg('"'))<cr>

"-------------------------------------------------------------------------------
" plugin: vim-molder
"-------------------------------------------------------------------------------

nnoremap - :execute 'edit' expand('%:p:h')<cr>
nnoremap g- :execute 'vnew' expand('%:p:h')<cr>
let g:molder_ext_buftype = 'nowrite'

"-------------------------------------------------------------------------------
" plugin: vim-today
"-------------------------------------------------------------------------------

nmap <leader>t <plug>(today-open)
let g:today_dir = '~/Dropbox/memo'

"-------------------------------------------------------------------------------
" plugin: vim-gitgutter
"-------------------------------------------------------------------------------

let g:gitgutter_map_keys = 0

"-------------------------------------------------------------------------------
" plugin: PaperColor
"-------------------------------------------------------------------------------

"let g:PaperColor_Theme_Options = {
" \   'theme': {
" \     'default.dark': {
" \       'allow_bold': 1,
" \       'allow_italic': 1,
" \     }
" \   }
" \ }

"colorscheme PaperColor

"-------------------------------------------------------------------------------
" plugin: gruvbox
"-------------------------------------------------------------------------------

let g:gruvbox_italic = 1
let g:gruvbox_sign_column = 'bg0'
colorscheme gruvbox

"-------------------------------------------------------------------------------
" plugin: syntax-
"-------------------------------------------------------------------------------

let g:plantuml_set_makeprg = 0

"-------------------------------------------------------------------------------
" plugin: vim-prettier
"-------------------------------------------------------------------------------

"let g:prettier#quickfix_enabled = 0
"augroup prettier
"    autocmd!
"    autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.html PrettierAsync
"augroup END

"-------------------------------------------------------------------------------
" plugin: emmet-vim
"-------------------------------------------------------------------------------

let g:emmet_install_only_plug = 1
imap <c-e> <plug>(emmet-expand-abbr)

let g:user_emmet_settings = {
\    'html': {
\        'snippets': {
\            'Grid:c': "<Grid container>${child}${cursor}</Grid>",
\            'Grid:i': "<Grid item>${child}${cursor}</Grid>",
\        },
\    },
\}

"-------------------------------------------------------------------------------
" plugin: vim-matchup
"-------------------------------------------------------------------------------

let g:matchup_mappings_enabled = 0
nmap % <plug>(matchup-%)

"-------------------------------------------------------------------------------
" plugin: tagalong.vim
"-------------------------------------------------------------------------------

let g:tagalong_filetypes = ['xml', 'html', 'javascriptreact', 'typescriptreact']

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
  call minpac#add('qpkorr/vim-renamer')
  "call minpac#add('mattn/vim-goimports')
  "call minpac#add('thinca/vim-quickrun')
  call minpac#add('prabirshrestha/vim-lsp')
  call minpac#add('mattn/vim-lsp-settings')
  call minpac#add('hrsh7th/vim-vsnip')
  call minpac#add('hrsh7th/vim-vsnip-integ')
  "call minpac#add('prabirshrestha/asyncomplete.vim')
  "call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
  "call minpac#add('prettier/vim-prettier')
  "call minpac#add('simeji/winresizer')
  "call minpac#add('airblade/vim-gitgutter')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('mattn/vim-molder')
  call minpac#add('tkhrmd/vim-molder-buftype', {'frozen': 1})
  call minpac#add('tkhrmd/vim-molder-lastpath', {'frozen': 1})
  call minpac#add('mattn/vim-sonictemplate')
  call minpac#add('previm/previm')
  "call minpac#add('mattn/vim-lexiv')
  "call minpac#add('mattn/vim-maketable')
  "call minpac#add('chrisbra/matchit')
  call minpac#add('vim-python/python-syntax')
  "call minpac#add('tmux-plugins/vim-tmux-focus-events')
  "call minpac#add('roxma/vim-tmux-clipboard')
  "call minpac#add('nathanaelkane/vim-indent-guides')
  "call minpac#add('tpope/vim-surround')
  "call minpac#add('machakann/vim-sandwich')
  "call minpac#add('mattn/benchvimrc-vim')
  call minpac#add('fcpg/vim-osc52')
  call minpac#add('ap/vim-buftabline')
  call minpac#add('tkhrmd/vim-today')
  "call minpac#add('mattn/vim-prompter')
  "call minpac#add('koron/vim-monochromenote')
  "call minpac#add('yasukotelin/shirotelin')
  "call minpac#add('jaredgorski/fogbell.vim')
  "call minpac#add('NLKNguyen/papercolor-theme')
  "call minpac#add('arzg/vim-colors-xcode')
  "call minpac#add('vim/colorschemes')
  "call minpac#add('joshdick/onedark.vim')
  "call minpac#add('aereal/vim-colors-japanesque')
  "call minpac#add('jonathanfilip/vim-lucius')
  "call minpac#add('rakr/vim-one')
  call minpac#add('morhetz/gruvbox')
  "call minpac#add('lifepillar/vim-solarized8')
  "call minpac#add('jeffkreeftmeijer/vim-dim')
  "call minpac#add('ghifarit53/tokyonight-vim')
  "call minpac#add('ap/vim-readdir')
  "call minpac#add('vim-scripts/Align')
  call minpac#add('aklt/plantuml-syntax')
  call minpac#add('mattn/emmet-vim')
  call minpac#add('andymass/vim-matchup')
  call minpac#add('AndrewRadev/tagalong.vim')
endfunction

command! PackUpdate call s:install_minpac() | source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()


"highlight! link SignColumn LineNr
let g:lsp_document_code_action_signs_enabled = 0
let g:python_highlight_all = 1



vnoremap v $h

" コマンドラインモード時の移動をEmacs風にする
" 行頭へ移動
cnoremap <C-a> <Home>
" 一文字戻る
cnoremap <C-b> <Left>
" カーソルの下の文字を削除
cnoremap <C-d> <Del>
" 行末へ移動
cnoremap <C-e> <End>
" 一文字進む
cnoremap <C-f> <Right>
" コマンドライン履歴を一つ進む
cnoremap <C-n> <Down>
" コマンドライン履歴を一つ戻る
cnoremap <C-p> <Up>


