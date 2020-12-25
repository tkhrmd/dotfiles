# dotfiles

## git

```
git config --global alias.st status
git config --global alias.co checkout
# git config --global alias.ico \!"git co \$(git b | fzy | awk '{print \$NF}')"
git config --global alias.p pull
git config --global alias.b "branch --sort=-authordate"
git config --global alias.f fetch
```

## apps (mac)

とりあえずインストールするもの

* [Homebrew](https://brew.sh/)
* [Docker for Mac](https://docs.docker.com/docker-for-mac/)
* [AppCleaner](https://freemacsoft.net/appcleaner/)
* [Rectangle](https://rectangleapp.com/)
* [MacVim](https://github.com/macvim-dev/macvim)
* [Amphetamine](https://apps.apple.com/jp/app/id937984704)
* [Quick View Calendar](https://apps.apple.com/jp/app/id1087080039)
* [Scroll Reverser](https://pilotmoon.com/scrollreverser/)
* [AltTab](https://alt-tab-macos.netlify.app/)
* [iTerm2](https://www.iterm2.com/)
* Go
* Node.js
* Google Cloud SDK

```
$ brew install ripgrep tmux
$ npm install -g prettier @google/clasp
$ pip3 install black sqlparse
```

## .zshrc

補完周りをbashの動作に近づける設定

```
# プロンプトにブランチと時刻を表示
git_branch() {
  b="$(git symbolic-ref HEAD 2>/dev/null | awk '{sub("refs/heads/", ""); print $0;}')"
  test -n "$b" && echo " ($b)"
}
setopt prompt_subst
PROMPT=$'%F{4}%~%f$(git_branch)\n%F{6}%D{%H:%M}%f %# '

# タブで順番に補完するのを無効化
unsetopt auto_menu

# 未入力状態でtab押してもタブ入力されない
zstyle ':completion:*' insert-tab false

# sshの補完を.ssh/configから取得
autoload -Uz compinit; compinit
_cache_hosts=($(grep ^Host $HOME/.ssh/config | awk '$2 != "" {print $2}'))

# 便利リネーム
alias renamer='vim -c Renamer'
```

## ~/.docker/config.json

デフォルトctrl-pがつらい

```
{
  "detachKeys" : "ctrl-\\"
}
```
