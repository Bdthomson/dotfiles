
# ea = Edit Aliases
alias ea='vim ~/.zshrc'

# reload = Reload .zshrc
alias reload='. ~/.zshrc'

# hg = Grep History for term. Usage: hg term
alias hg='history | grep -i'

# ll = List all files in long format
alias ll='ls -lAF'

# Kills a process running on a port. Usage: killport 3000
killport(){
    kill -9 $(fuser -n tcp $1 2> /dev/null);
}