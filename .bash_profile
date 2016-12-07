export CLICOLOR=1
export TERM="xterm-color"
# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Pretty prompt
function git_branch(){
    git branch 2> /dev/null | awk '{if ($1=="*") print "  ("$2")"}'
}
PS1='| \[\e[0;34m\]$(date +"%H:%M")\[\e[0m\]  \[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\[\e[0;33m\]$(git_branch)\[\e[0m\] |\n\$ '

# Remember all the things
export HISTSIZE=10000000
export HISTFILESIZE=10000000

. ~/.bashrc
