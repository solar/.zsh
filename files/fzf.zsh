FZF_INSTALL_DIR="/usr/local/opt/fzf"

# Setup fzf
# ---------
if [[ ! "$PATH" == *{$FZF_INSTALL_DIR}/bin* ]]; then
  export PATH="${PATH:+${PATH}:}${FZF_INSTALL_DIR}/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${FZF_INSTALL_DIR}/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${FZF_INSTALL_DIR}/shell/key-bindings.zsh"

export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --style=header,grid --line-range :100 {}"'
