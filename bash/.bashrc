[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

fortune -s

krabby random --no-variant 1

eval "$(starship init bash)"
eval "$(direnv hook bash)"

export PATH="$PATH:/home/dante/.local/bin"

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
