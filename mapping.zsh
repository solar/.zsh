bindkey -v

bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

bindkey -a 'q' push-line

bindkey '^kc' anyframe-widget-cdr
bindkey '^k^c' anyframe-widget-cdr
bindkey -M vicmd 'kc' anyframe-widget-cdr

bindkey '^xp' anyframe-widget-kill
bindkey '^x^p' anyframe-widget-kill
bindkey -M vicmd 'kp' anyframe-widget-kill

bindkey '^kb' anyframe-widget-insert-git-branch
bindkey '^k^b' anyframe-widget-insert-git-branch
bindkey -M vicmd 'kb' anyframe-widget-insert-git-branch
