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

RG_ARGS=(
--files
--hidden
--follow
"--glob '!.git/*'"
"--glob '!Library/*'"
)

export FZF_CTRL_T_COMMAND="rg $RG_ARGS"
export FZF_CTRL_T_OPTS='--preview "bat --color=always --style=header,grid --line-range :100 {}"'

# ssh config
function ssh-fzf () {
  local selected_host=$(grep -i -E "^Host " ~/.ssh/config ~/ssh-config/**/* | cut -d ' ' -f 2- | fzf --query "$LBUFFER")
  if [ -n "$selected_host" ]; then
    BUFFER="ssh ${selected_host}"
  fi
  zle reset-prompt
}
zle -N ssh-fzf
bindkey '^ks' ssh-fzf

# ghq
function ghq-fzf () {
  local selected=$(ghq list --full-path | fzf --query "$LBUFFER")
  if [ -n "$selected" ]; then
    cd ${selected}
  fi
  zle reset-prompt
}
zle -N ghq-fzf
bindkey '^kg' ghq-fzf

# history
function history-fzf () {
  local selected=$(history -n -r 1 | awk '!a[$0]++' | fzf --query "$LBUFFER")
  if [ -n "$selected" ]; then
    BUFFER=$selected
  fi
  zle reset-promgT
}
zle -N history-fzf
bindkey '^kh' history-fzf

# docker container rm
function docker-rm-fzf () {
  local selected=$(docker container ls -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}" | fzf --query "$LBUFFER" | awk '{print $1}')
  if [ -n "$selected" ]; then
    BUFFER="docker rm ${selected}"
  fi
  zle reset-prompt
}
zle -N docker-rm-fzf
bindkey '^kdr' docker-rm-fzf

##### AWS #####
# SQS
function aws-sqs-list-queues () {
    local selected=$(aws sqs list-queues --query 'QueueUrls' | jq -r '.[]' | fzf --query "$LBUFFER")
    if [ -n "$selected" ]; then
        BUFFER="aws sqs receive-message --queue-url ${selected}"
    fi
    zle reset-prompt
}
zle -N aws-sqs-list-queues
bindkey '^kaslq' aws-sqs-list-queues
