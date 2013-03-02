# git branch in the prompt
PS1='\[\e[1;34m\]\u\[\e[36m\]@\[\e[32m\]\h\[\e[30m\]$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo " [$(git branch | grep '^*' |sed s/\*\ //)]"; fi) \[\e[35m\]\w\[\e[36m\]\[\e[0m\] \[\e[30m\]\[\e[36m\]\$\[\e[0m\] '

PATH=$HOME/bin:$PATH

# some system-specific stuff
OS=`uname -s`

case "$OS" in
    "Darwin"|"FreeBSD")
        export CLICOLOR=1
        # colors output
        export LSCOLORS=ExFxCxDxBxegedabagaced
        # Get color support for 'less'
        export LESS="--RAW-CONTROL-CHARS"

        export ADIUM_LOG_DIR=/Users/davidcollins4481/Library/Application\ Support/Adium\ 2.0/Users/Default/Logs
        alias logs='cd "$ADIUM_LOG_DIR"'

        # Use colors for less, man, etc.
        [[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

        export GREP_OPTIONS="--color=auto"
        ;;
    "Linux")
        export GREP_OPTIONS="--color=auto"
        ;;
    * ) 
        echo "Unknown OS [$OS]"
        ;;
esac
