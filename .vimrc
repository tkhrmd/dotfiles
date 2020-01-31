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
set synmaxcol=100
set tabstop=4
set termguicolors
set ttyfast
set updatetime=1000
set viminfo=
set wildmode=longest,list
set pastetoggle=<leader>p

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
  set grepprg=rg\ --vimgrep\ --smart-case
endif

let g:gruvbox_italic=1
colorscheme gruvbox
filetype plugin indent on
syntax enable

"-------------------------------------------------------------------------------
" disable builtin plugins
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
nnoremap <Space>g :silent<Space>grep!<Space><Space>\|<Space>redraw!<HOME><S-Right><S-Right><Right>
nnoremap <Space>v :vimgrep<Space>/\c/j<Space>%<HOME><S-Right><Right><Right>
nnoremap Q <Nop>
command! Q echo 'may be a typo in "q"'
vnoremap < <gv
vnoremap > >gv
nnoremap <C-g> 1<C-g>

"-------------------------------------------------------------------------------
" syntax by file type
"-------------------------------------------------------------------------------

augroup mysyntax
  autocmd!
  autocmd FileType css        setlocal tabstop=2
  autocmd FileType html       setlocal tabstop=2
  autocmd FileType javascript setlocal tabstop=2
  autocmd FileType json       setlocal tabstop=2
  autocmd FileType ruby       setlocal tabstop=2
  autocmd FileType vim        setlocal tabstop=2
  autocmd FileType yaml       setlocal tabstop=2
  autocmd FileType go         setlocal noexpandtab
augroup END

"-------------------------------------------------------------------------------
" file type
"-------------------------------------------------------------------------------

augroup myfiletype
  autocmd!
  autocmd BufNewFile,BufRead *.yml.liquid setlocal filetype=yaml
  autocmd BufNewFile,BufRead *.dig setlocal filetype=yaml indentkeys-=<:> indentkeys-=0#
augroup END

"-------------------------------------------------------------------------------
" behavior
"-------------------------------------------------------------------------------

augroup myvimbehavior
  autocmd!
  "autocmd BufAdd * setlocal bufhidden=delete
  autocmd QuickfixCmdPost grep,vimgrep cwindow
  autocmd FileType markdown setlocal spelllang+=cjk spell
augroup END

"-------------------------------------------------------------------------------
" useful commands
"-------------------------------------------------------------------------------

" clear undo history
function! s:clear_undo() abort
  let old_undolevels = &undolevels
  setlocal undolevels=-1
  execute "normal! a \<BS>\<Esc>"
  let &l:undolevels = old_undolevels
endfunction
command! -bar ClearUndo call s:clear_undo()

" cd to current buffer
command! CdCurrent :cd %:h
command! LcdCurrent :lcd %:h

" reload vimrc after saving
augroup vimrc_autoreload
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
command! Vimrc tabnew $MYVIMRC

" format sql
if executable('sqlformat')
  autocmd FileType sql command! -range=% SQLFmt <line1>,<line2>!sqlformat -r -k upper -
endif

" tableize csv
if executable('xsv')
  command! -range=% XSVTable <line1>,<line2>!xsv table -
endif

"-------------------------------------------------------------------------------
" CtrlP
"-------------------------------------------------------------------------------

let g:ctrlp_types = ['buf', 'fil']
let g:ctrlp_match_func = {'match': 'pymatcher#PyMatch'}
"let g:ctrlp_match_current_file = 1
if executable('rg')
  let g:ctrlp_user_command = 'rg --files %s'
endif
let g:ctrlp_lazy_update = 1
let g:ctrlp_use_caching = 0
" let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_match_window = 'results:50'
let g:ctrlp_prompt_mappings = {
            \   'PrtBS()': ['<c-h>', '<bs>'],
            \   'PrtCurLeft()': ['<left>'],
            \ }
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'

"-------------------------------------------------------------------------------
" Table Mode
"-------------------------------------------------------------------------------

let g:table_mode_corner='|'

"-------------------------------------------------------------------------------
" vim-lsp
"-------------------------------------------------------------------------------

let g:lsp_settings = {
            \   'gopls' : {
            \     'workspace_config': {
            \       'gopls': {
            \         'staticcheck': v:true,
            \         'completeUnimported': v:true,
            \         'caseSensitiveCompletion': v:true,
            \         'usePlaceholders': v:true,
            \         'completionDocumentation': v:true,
            \         'watchFileChanges': v:true,
            \         'hoverKind': 'SingleLine',
            \       },
            \     },
            \   },
            \ }

"autocmd FileType go nnoremap <buffer><silent> <c-]>  :LspDefinition<cr>
autocmd FileType go setlocal omnifunc=lsp#complete
"autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
autocmd FileType go nmap <buffer><silent> <c-]> <plug>(lsp-definition)

let g:lsp_settings_python = 'pyls-ms'

"let g:lsp_signs_enabled = 1
"let g:lsp_signs_error = {'text': '✗'}
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
"let g:asyncomplete_auto_completeopt = 0
"let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 0

"-------------------------------------------------------------------------------
" previm
"-------------------------------------------------------------------------------

let g:previm_open_cmd = 'open -a Google\ Chrome'
let g:previm_disable_default_css = 1
let g:previm_enable_realtime = 1

"-------------------------------------------------------------------------------
" lightline
"-------------------------------------------------------------------------------

let g:lightline = {'colorscheme': 'gruvbox'}

"-------------------------------------------------------------------------------
" Dirvish
"-------------------------------------------------------------------------------

nmap g- <Plug>(dirvish_vsplit_up)

"-------------------------------------------------------------------------------
" vim-markdown
"-------------------------------------------------------------------------------

let g:vim_markdown_folding_disabled = 1

"-------------------------------------------------------------------------------
" minpac
"-------------------------------------------------------------------------------

if executable('git')
  command! MinpacInstall echo system('git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac')
endif

if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('FelikZ/ctrlp-py-matcher')
  call minpac#add('ctrlpvim/ctrlp.vim')
  call minpac#add('romainl/vim-qf')
  call minpac#add('qpkorr/vim-renamer')

  call minpac#add('h1mesuke/vim-alignta')
  call minpac#add('othree/yajs.vim')

  call minpac#add('mattn/vim-goimports')
  call minpac#add('thinca/vim-quickrun')
  " call minpac#add('tpope/vim-markdown')
  " call minpac#add('plasticboy/vim-markdown')

  call minpac#add('prabirshrestha/asyncomplete.vim')
  call minpac#add('prabirshrestha/async.vim')
  call minpac#add('prabirshrestha/vim-lsp')
  call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
  call minpac#add('mattn/vim-lsp-settings')
  "call minpac#add('mattn/vim-lsp-icons')
  "call minpac#add('hrsh7th/vim-vsnip')
  "call minpac#add('hrsh7th/vim-vsnip-integ')

  call minpac#add('prettier/vim-prettier', {'do': {-> system('npm install')}})

  call minpac#add('dhruvasagar/vim-table-mode')
  call minpac#add('simeji/winresizer')
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('justinmk/vim-dirvish')
  call minpac#add('mattn/vim-sonictemplate')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('previm/previm')
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('kana/vim-tabpagecd')
  call minpac#add('mattn/vim-lexiv')

"  call minpac#add('kana/vim-smartinput')
"  call minpac#add('joshdick/onedark.vim')
"  call minpac#add('aereal/vim-colors-japanesque')
"  call minpac#add('jonathanfilip/vim-lucius')
"  call minpac#add('rakr/vim-one')
  call minpac#add('morhetz/gruvbox')
  call minpac#add('lifepillar/vim-solarized8')
endif
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
