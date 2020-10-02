source ~/.zplug/init.zsh

zplug "zsh-users/zsh-history-substring-search"

zplug "mafredri/zsh-async", from:github

zplug "sorin-ionescu/prezto"
zplug "modules/environment", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/history", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/prompt", from:prezto

zplug "modules/git", from:prezto

zplug "mollifier/anyframe"

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "junegunn/fzf-bin", \
	from:gh-r, \
	as:command, \
	rename-to:fzf, \
	use:"*linux*amd64*"

# Can manage local plugins
zplug "~/.zsh", from:local

zplug load

eval "$(direnv hook zsh)"
fpath=($fpath "/home/solar/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
fpath=($fpath "/home/solar/.zfunctions")
fpath=($fpath "/home/solar/.zfunctions")
fpath=($fpath "/home/solar/.zfunctions")
