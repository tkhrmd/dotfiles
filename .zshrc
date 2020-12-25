# プロンプトにブランチと時刻を表示
git_branch() {
  b="$(git symbolic-ref HEAD 2>/dev/null | awk '{sub("refs/heads/", ""); print $0;}')"
  test -n "$b" && echo " ($b)"
}
setopt prompt_subst
PROMPT=$'%F{4}%~%f$(git_branch)\n%F{6}%D{%H:%M}%f %# '

# 補完周りをbashの動作に近づける設定

# タブで順番に補完するのを無効化
unsetopt auto_menu

# 未入力状態でtab押してもタブ入力されない
zstyle ':completion:*' insert-tab false

# sshの補完を.ssh/configから取得
autoload -Uz compinit; compinit
_cache_hosts=($(grep ^Host $HOME/.ssh/config | awk '$2 != "" {print $2}'))

# 便利リネーム
alias renamer='vim -c Renamer'
