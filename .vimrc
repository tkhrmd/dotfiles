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
set grepprg=rg\ --vimgrep\ --smart-case
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
set number
set scroll=5
set scrolloff=5
set shellslash
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
set tabstop=4
set ttyfast
set viminfo=
set wildmode=longest,list

" map
nnoremap / /\v
nnoremap <Space>g :silent<Space>grep!<Space><Space>\|<Space>redraw!<HOME><S-Right><S-Right><Right>
nnoremap <Space>v :vimgrep<Space>/\c/j<HOME><S-Right><Right><Right>
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
let g:ctrlp_user_command = 'rg --files %s'
let g:ctrlp_lazy_update = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_match_window = 'results:50'
let g:ctrlp_prompt_mappings = {
      \ 'PrtBS()': ['<c-h>', '<bs>'],
      \ 'PrtCurLeft()': ['<left>'],
      \}
let g:ctrlp_working_path_mode = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'


let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \}

if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'javascript support using typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
        \ 'whitelist': ['javascript', 'javascript.jsx'],
        \})
endif

" syntax
" colorscheme lucius
colorscheme gruvbox
syntax enable

" filetype
filetype plugin indent on

" plugin manager
" git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('https://github.com/FelikZ/ctrlp-py-matcher')
  call minpac#add('https://github.com/ctrlpvim/ctrlp.vim')
  call minpac#add('https://github.com/fatih/vim-go')
  call minpac#add('https://github.com/h1mesuke/vim-alignta')
  call minpac#add('https://github.com/jonathanfilip/vim-lucius')
  call minpac#add('https://github.com/othree/yajs.vim')
  call minpac#add('https://github.com/qpkorr/vim-renamer')
  call minpac#add('https://github.com/rakr/vim-one')
  call minpac#add('https://github.com/morhetz/gruvbox')
  call minpac#add('https://github.com/thinca/vim-quickrun')
  call minpac#add('https://github.com/w0rp/ale')
  call minpac#add('https://github.com/tpope/vim-markdown')
  call minpac#add('https://github.com/prabirshrestha/asyncomplete.vim')
  call minpac#add('https://github.com/prabirshrestha/async.vim')
  call minpac#add('https://github.com/prabirshrestha/vim-lsp')
  call minpac#add('https://github.com/prabirshrestha/asyncomplete-lsp.vim')
  call minpac#add('dhruvasagar/vim-table-mode')
  call minpac#add('simeji/winresizer')
  call minpac#add('airblade/vim-gitgutter')
endif
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

function! s:clear_undo() abort
  let old_undolevels = &undolevels
  setlocal undolevels=-1
  execute "normal! a \<BS>\<Esc>"
  let &l:undolevels = old_undolevels
endfunction
command! -bar ClearUndo  call s:clear_undo()

command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
      \ | diffthis | wincmd p | diffthis
