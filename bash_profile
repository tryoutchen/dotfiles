# Ubuntu will not load ".profile" if .bash_profile exists, load it manually.
if [ -f ~/.profile ]; then
    . ~/.profile
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

###############################################################################
##### Customization
###############################################################################

#unamestr=`uname`
#if [[ `uname` == 'Darwin' ]]; then
#export CLICOLOR=1
#export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#fi

# For 'Ctrl+s' search
stty -ixon

PATH=$PATH:~/bin
PATH=$PATH:~/Android/Sdk/platform-tools

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias load="source build/envsetup.sh"
alias bell="echo -ne '\007'"
alias grep="grep --color=auto"

function jgrep()
{
    find . -type f -name .repo -prune -o -name .git -prune -o -name out -prune -o -name "*\.java" \
        -exec grep --color -n "$@" {} +
}

function cgrep()
{
    find . -type f -name .repo -prune -o -name .git -prune -o -name out -prune -o \( -name '*.S' -o -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' -o -name '*.hpp' \) \
        -exec grep --color -n "$@" {} +
}

case `uname -s` in
    Darwin)
        #echo "Darwin"
        export CLICOLOR=1
        export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
        function mgrep()
        {
            find -E . -name .repo -prune -o -name .git -prune -o -path ./out -prune -o -type f -iregex '.*/(Makefile|Makefile\..*|.*\.make|.*\.mak|.*\.mk)' \
                -exec grep --color -n "$@" {} +
        }
        ;;

    *)
		#echo "Others"
        function mgrep()
        {
            find . -type f -name .repo -prune -o -name .git -prune -o -path ./out -prune -o -regextype posix-egrep -iregex '(.*\/Makefile|.*\/Makefile\..*|.*\.make|.*\.mak|.*\.mk|.*\.bp)' \
                -exec grep --color -n "$@" {} +
        }
		;;
esac
