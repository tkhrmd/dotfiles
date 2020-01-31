# dotfiles

## Gitのエイリアス設定

```
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ico \!"git co \$(git b | fzy | awk '{print \$NF}')"
git config --global alias.p pull
git config --global alias.b "branch  --sort=-authordate"
git config --global alias.f fetch
```

## (Mac) インストールするもの

* [Homebrew](https://brew.sh/)
* [Docker for Mac](https://docs.docker.com/docker-for-mac/)
* [AppCleaner](https://freemacsoft.net/appcleaner/)
* [Rectangle](https://rectangleapp.com/)
* [MacVim](https://github.com/macvim-dev/macvim)
* [Amphetamine](https://apps.apple.com/jp/app/id937984704)
* [Quick View Calendar](https://apps.apple.com/jp/app/id1087080039)
* [Scroll Reverser](https://pilotmoon.com/scrollreverser/)

```
$ brew install ripgrep
```
