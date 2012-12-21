#export PS1="\e[m\u@\h \W\$ \e[m"
# look at the perty colors!
PS1='\[\e[1;34m\]\u\[\e[36m\]@\[\e[32m\]\h\[\e[30m\]$ \[\e[35m\]\w \[\e[36m\]\$\[\e[0m\] '
export ADIUM_LOG_DIR=/Users/davidcollins4481/Library/Application\ Support/Adium\ 2.0/Users/Default/Logs
alias logs='cd "$ADIUM_LOG_DIR"'
# some system-specific stuff
OS=`uname -s`

case "$OS" in
    "Darwin"|"FreeBSD")
        export CLICOLOR=1
        # colors output
        export LSCOLORS=ExFxCxDxBxegedabagaced
        # Get color support for 'less'
        export LESS="--RAW-CONTROL-CHARS"

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


## Functions

# Extracting archives
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

#netinfo - shows network information for your system
netinfo ()
{
echo "--------------- Network Information ---------------"
/sbin/ifconfig | awk /'inet addr/ {print $2}'
/sbin/ifconfig | awk /'Bcast/ {print $3}'
/sbin/ifconfig | awk /'inet addr/ {print $4}'
/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
#myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
#echo "${myip}"
echo "---------------------------------------------------"
}
