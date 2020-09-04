HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# vim-like keys when editing
bindkey -v

# Completion
autoload -Uz compinit
compinit

# Ignore case (only when typing lower-case)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

alias md='mkdir -p'
alias cl='clear'
alias ls='ls -h'
alias e='subl'

alias g='git'
alias ga='git add'
alias gci='git commit'
alias gbr='git checkout -b'
alias gco='git checkout'
alias gl='git log'



## PROMPT - START

PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{yellow}%1~%f%b > '
# %(?.√.?%?)	if return code ? is 0, show √, else show ?%?
# %?	exit code of previous command
# %1~	current working dir, shortening home to ~, show only last 1 element
# %#	# with root privileges, % otherwise
# %B %b	start/stop bold
# %F{...}	text (foreground) color, see table
# %f	reset to default textcolor

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats 'git:%F{yellow}#%b%f'
zstyle ':vcs_info:*' enable git

## PROMPT - END