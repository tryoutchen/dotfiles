# Ubuntu will not load ".profile" if .bash_profile exists, load it manually.
if [ -f ~/.profile ]; then
    . ~/.profile
fi

###############################################################################
##### Customization
###############################################################################
PATH=~/bin:$PATH
PATH=~/Android/Sdk/platform-tools:$PATH
alias load="source build/envsetup.sh"
alias bell="echo -ne '\007'"

function jgrep()
{
	find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f -name "*\.java" \
		-exec grep --color -n "$@" {} +
}

function cgrep()
{
	find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f \( -name '*.S' -o -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' -o -name '*.hpp' \) \
		-exec grep --color -n "$@" {} +
}

function mgrep()
{
	find . -name .repo -prune -o -name .git -prune -o -path ./out -prune -o -regextype posix-egrep -iregex '(.*\/Makefile|.*\/Makefile\..*|.*\.make|.*\.mak|.*\.mk|.*\.bp)' -type f \
		-exec grep --color -n "$@" {} +
}
