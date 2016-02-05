# dotfiles

## vim

### install plugin

```
# plugin directory
mkdir -p ~/.vim/plugins

# clone plugins
cd ~/.vim/plugins/
cat << EOP | xargs -n 1 -P 4 git clone
https://github.com/Chiel92/vim-autoformat.git
https://github.com/FelikZ/ctrlp-py-matcher.git
https://github.com/Valloric/YouCompleteMe.git
https://github.com/ctrlpvim/ctrlp.vim.git
https://github.com/digitaltoad/vim-jade.git
https://github.com/fatih/vim-go.git
https://github.com/h1mesuke/vim-alignta.git
https://github.com/jonathanfilip/vim-lucius.git
https://github.com/maeda1991/vim-remove-trailing-space.git
https://github.com/maeda1991/vim-wipeout-noncurrent-buffers.git
https://github.com/pangloss/vim-javascript.git
https://github.com/ternjs/tern_for_vim.git
EOP

# install vim-autoformat
npm install -g js-beautify

# install YouCompleteMe
cd ~/.vim/plugins/YouCompleteMe/
python install.py --gocode-completer

# install tern_for_vim
cd ~/.vim/plugins/tern_for_vim/
npm install
```
