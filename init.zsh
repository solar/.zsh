setopt auto_pushd
cdpath=(~)
chpwd_functions=($chpwd_functions dirs)

setopt inc_append_history share_history extended_history hist_ignore_dups
setopt hist_find_no_dups hist_ignore_space no_hist_beep no_beep
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

typeset -gU cdpath fpath mailpath path
path=(
  $HOME/bin
  $HOME/.yarn/bin
  $HOME/.config/yarn/global/node_modules/.bin
  /usr/local/{bin,sbin}
  /usr/local/go/bin
  $HOME/.cargo/bin
  $path
)

zstyle ":anyframe:selector:" use fzf

alias ll="ls -laFG"
alias vim="nvim"

source ~/.zsh/mapping.zsh
source ~/.zsh/alias.zsh
