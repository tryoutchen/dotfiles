# Ubuntu will not load ".profile" if .bash_profile exists, load it manually.
if [ -f ~/.profile ]; then
    . ~/.profile
fi

###############################################################################
##### Customization
###############################################################################
stty -ixon

PATH=$PATH:~/bin
PATH=$PATH:~/Android/Sdk/platform-tools

alias load="source build/envsetup.sh"
alias bell="echo -ne '\007'"

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

function mgrep()
{
	find . -type f -name .repo -prune -o -name .git -prune -o -path ./out -prune -o -regextype posix-egrep -iregex '(.*\/Makefile|.*\/Makefile\..*|.*\.make|.*\.mak|.*\.mk|.*\.bp)' \
		-exec grep --color -n "$@" {} +
}
