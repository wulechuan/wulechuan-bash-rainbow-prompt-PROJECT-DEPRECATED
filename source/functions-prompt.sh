export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_HIDE_IF_PWD_IGNORED=true





if [ -f "$___bashScriptsRootFolder/GNU-tools/git-prompt.sh" ]; then
	source "$___bashScriptsRootFolder/GNU-tools/git-prompt.sh";
fi

___tempDetectGitPS1Function___=`declare -f __git_ps1 > /dev/null; echo $?`
if [ $___tempDetectGitPS1Function___ -ne 0 ]; then
	function __git_ps1 { # This is a simplified version of __git_ps1 if we have no GNU source code.
		git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
	}
fi
unset ___tempDetectGitPS1Function___


function _customize_prompt_with_git_branch_info_in_256_colors_ {
	PS1=`clear-color`"\n"                         # New line

	PS1=$PS1"\e[38;5;16;48;5;210m`date +"%m-%d"`" # Month & Day
	PS1=$PS1"\e[38;5;16;48;5;216m "               # A <Space>
	PS1=$PS1"\e[38;5;16;48;5;229m`date +"%H:%M"`" # Hour & Minute
	PS1=$PS1"\e[38;5;16;48;5;120m "               # A <space>

	PS1="${PS1}\e[38;5;16;48;5;49m$USERNAME"      # user
	PS1="${PS1}\e[38;5;16;48;5;87m@"              # @
	PS1="${PS1}\e[38;5;16;48;5;45m\h"             # host
	PS1="${PS1}\e[38;5;16;48;5;39m:"              # :
	PS1="${PS1}\e[38;5;16;48;5;69m\w"             # current working directory
	PS1=$PS1"\e[38;5;16;48;5;63m "                # A <space>

	PS1=$PS1`__get_git_ps1_or_empty_string_in_256_colors__` # git branch info

	PS1=$PS1`clear-color`'\n'                     # New line
	PS1=$PS1'> '                                  # last prompt sign: $<space>
	PS1=$PS1`clear-color`
}

function _customize_prompt_with_git_branch_info_in_16_colors_ {
	PS1=`clear-color`"\n"

	local timestampe=`date +"%m-%d %H:%M"`
	PS1=$PS1`colorful "$timestampe" textBrightBlack`" " # timestamp

	PS1=$PS1`colorful "\u"  textBlack       bgndCyan`      # user
	PS1=$PS1`colorful "@"   textBlack       bgndGreen`     # @
	PS1=$PS1`colorful "\h"  textBlack       bgndYellow`    # host
	PS1=$PS1`colorful ":"   textBrightBlack bgndBrightRed` # :
	PS1=$PS1`colorful "\w"  textBlack       bgndMagenta`   # current working directory

	PS1=$PS1`__get_git_ps1_or_empty_string_in_16_colors__`

	PS1=$PS1`clear-color`'\n'
	PS1=$PS1'$ '                       # last prompt sign: $<space>
	PS1=$PS1`clear-color`
}

function __get_git_ps1_or_empty_string_in_256_colors__ {
	local gitBranchInfo=`__git_ps1`
	# local gitBranchInfo=`__parse_git_branch_info__`

	if [ -z "$gitBranchInfo" ]; then
		echo -n ''
		return
	fi

	echo -e `clear-color`
	echo -en "\e[38;5;246m["
	echo -en "\e[38;5;120m$gitBranchInfo"
	echo -en "\e[38;5;246m]"
	echo -e `clear-color`
}

function __get_git_ps1_or_empty_string_in_16_colors__ {
	local gitBranchInfo=`__git_ps1`
	# local gitBranchInfo=`__parse_git_branch_info__`

	if [ -z "$gitBranchInfo" ]; then
		echo -n ''
		return
	fi

	echo -e `clear-color`
	echo -e `colorful '[' textBrightBlack``colorful $gitBranchInfo textGreen``colorful ']' textBrightBlack`
}
