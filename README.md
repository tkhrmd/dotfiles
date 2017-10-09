# dotfiles

## set up Vim

```
mkdir -p ~/.vim/pack/plugins/start
cd $_
cat << EOP | xargs -n 1 -P 4 git clone
https://github.com/FelikZ/ctrlp-py-matcher.git
https://github.com/ctrlpvim/ctrlp.vim.git
https://github.com/fatih/vim-go.git
https://github.com/h1mesuke/vim-alignta.git
https://github.com/jonathanfilip/vim-lucius.git
https://github.com/maralla/completor.vim.git
https://github.com/othree/yajs.vim.git
https://github.com/Chiel92/vim-autoformat.git
EOP

# install js-beautify for vim-autoformat
mkdir -p ~/.vim/pack/plugins/start/vim-autoformat/formatprograms/
cd $_
npm install js-beautify
```
