# dotfiles

## vim

### install plugin

```
mkdir -p ~/.vim/plugins
cd ~/.vim/plugins/

cat << EOP | xargs -n 1 git clone
https://github.com/Valloric/YouCompleteMe.git
https://github.com/FelikZ/ctrlp-py-matcher.git
https://github.com/ctrlpvim/ctrlp.vim.git
https://github.com/ternjs/tern_for_vim.git
https://github.com/h1mesuke/vim-alignta.git
https://github.com/Chiel92/vim-autoformat.git
https://github.com/pangloss/vim-javascript.git
https://github.com/jonathanfilip/vim-lucius.git
https://github.com/maeda1991/vim-remove-trailing-space.git
https://github.com/maeda1991/vim-wipeout-noncurrent-buffers.git
EOP

cd ~/.vim/plugins/YouCompleteMe/
./install.py --gocode-completer
cd ~/
npm install -g js-beautify
cd ~/.vim/plugins/tern_for_vim/
npm install
```
