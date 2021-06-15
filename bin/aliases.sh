
# Bash alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# delete moves to trash - always
(command -v trash-put >/dev/null 2>&1) && alias rm='trash-put'

# quilt for upstreaming source for debian packaging
alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
complete -F _quilt_completion -o filenames dquilt
