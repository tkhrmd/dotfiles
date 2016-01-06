# dotfiles

## vim

### install plugin

```
mkdir -p ~/.vim/plugins
cd ~/.vim/plugins/
git clone https://github.com/Valloric/YouCompleteMe.git
git clone https://github.com/FelikZ/ctrlp-py-matcher.git
git clone https://github.com/ctrlpvim/ctrlp.vim.git
git clone https://github.com/ternjs/tern_for_vim.git
git clone https://github.com/h1mesuke/vim-alignta.git
git clone https://github.com/Chiel92/vim-autoformat.git
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/jonathanfilip/vim-lucius.git
git clone https://github.com/maeda1991/vim-remove-trailing-space.git
git clone https://github.com/maeda1991/vim-wipeout-noncurrent-buffers.git

cd ~/.vim/plugins/YouCompleteMe/
./install.py --gocode-completer
cd ~/
npm install -g js-beautify
cd ~/.vim/plugins/tern_for_vim/
npm install
```
