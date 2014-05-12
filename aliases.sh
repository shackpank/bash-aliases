# less typing
alias gx="gitx"
alias gst="git status"
alias json="python -mjson.tool"

# "check out latest master"
alias colm="git checkout master && git pull && git status"

# merge master (in its most up to date status on origin)
# into the current branch
alias gmm="git fetch && git merge origin/master"

# checkout a branch; checkout can fail if the target branch  was pushed
# after the last fetch. so if checkout fails, this fetches and
# tries again.
function gco() {
    git checkout $@ || (git fetch && git checkout $@ )
}

# global blame. look for a particular pattern across all files
# and output who (probably) did it
function ggb() {
    git grep -n $1 | while IFS=: read i j k; do git blame -L $j,$j $i | cat; done
}
