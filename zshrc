autoload -U colors && colors

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

bindkey -e

alias ll="ls -FlAGh"
alias inst="pkg search -L name -x '.*' | tr -s ' ' | cut -d' ' -f1 | fzf --print0 | xargs doas pkg install -y"
alias cdd="fd -t d . $HOME | fzf"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

PROMPT='%F{blue}%5~%f %# '

EDITOR=emacs
