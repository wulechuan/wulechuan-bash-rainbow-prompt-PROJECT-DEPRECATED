source "$___bashScriptsRootFolder/source/utilities/ansi-colors.sh"

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_HIDE_IF_PWD_IGNORED=true

function _customize_prompt_with_git_branch_info_ {
	local osType=''

	if [ -r 'etc/issue' ]; then
		osType=`cat /etc/issue`
		osType=${osType/Kernel*/}
		osType=`colorful " $osType" textBlack bgndBrightBlack`'\n'
	fi

	PS1=`clear-color`
	PS1=$PS1$osType'\n'

	if test -f /etc/profile.d/git-sdk.sh
	then
		TITLEPREFIX=SDK-${MSYSTEM#MINGW}
	else
		TITLEPREFIX=$MSYSTEM
	fi

	gitBashString=$TITLEPREFIX
	if [ ! -z "$gitBashString" ]; then
		gitBashString=`colorful " Git Bash ($gitBashString) " textBlack bgndBrightBlack`'\n'
	fi

	PS1=$PS1"\[\033]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]" # set window title

	PS1=$PS1$gitBashString # show MSYSTEM
	PS1=$PS1`colorful "\u"          textBlack       bgndCyan`      # user
	PS1=$PS1`colorful "@"           textBlack       bgndGreen`     # @
	PS1=$PS1`colorful "\h"          textBlack       bgndYellow`    # host
	PS1=$PS1`colorful ":"           textBrightBlack bgndBrightRed` # :
	PS1=$PS1`colorful "\w"          textBlack       bgndMagenta`   # current working directory

	PS1=$PS1'`__git_ps1_or_empty_string`'

	PS1=$PS1'\n'
	PS1=$PS1'$ '     # last prompt sign: $<space>

	MSYS2_PS1=$PS1   # for detection by MSYS2 SDK's bash.basrc
}

function __git_ps1_or_empty_string () {
	local gitBranchInfo=

	if test -z "$WINELOADERNOEXEC"
	then
		GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
		COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
		COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
		COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
		if test -f "$COMPLETION_PATH/git-prompt.sh"
		then
			. "$COMPLETION_PATH/git-completion.bash"
			. "$COMPLETION_PATH/git-prompt.sh"
			gitBranchInfo=`__git_ps1 "%s"`     # bash function
		fi
	else
		gitBranchInfo="$(__git_ps1 '%s')"
	fi

	if [ -z "$gitBranchInfo" ]; then
		echo -n ''
		return
	fi

	echo
	echo `colorful '[' textBrightBlack``colorful $gitBranchInfo textGreen``colorful ']' textBrightBlack`
}