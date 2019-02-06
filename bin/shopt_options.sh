#shopt options
shopt -s autocd               # insert cd if name of folder.
shopt -s cdspell              # Correct cd typos
shopt -s cmdhist              # Bash attempts to save all lines of a multiple-line command in the same history entry
shopt -s histappend           # Append to history instead of overwriting it
shopt -s globstar 2>/dev/null # Turn on recursive globbing (enables ** to recurse all directories)
shopt -s nocaseglob           # Case-insensitive globbing (used in pathname expansion)
shopt -s checkwinsize         # check window size after reach command and update LINES and COLUMNS
