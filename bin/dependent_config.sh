## Dependents config

# liquid prompt settings
[[ $- = *i* ]] && source ~/.config/liquidprompt/liquidprompt

# fuzzy autocomplete
[ -f ~/.config/fzf/fzf.bash ] && source ~/.config/fzf/fzf.bash

# stop indent from making backup files
declare -x VERSION_CONTROL=none
