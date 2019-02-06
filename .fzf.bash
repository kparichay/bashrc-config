# Setup fzf
# ---------
if [[ ! "$PATH" == */home/kparichay/Tools/fzf/bin* ]]; then
  export PATH="$PATH:/home/kparichay/Tools/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/kparichay/Tools/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/kparichay/Tools/fzf/shell/key-bindings.bash"

