export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_HIDE_IF_PWD_IGNORED=true


wlcRainbowPrompt_256Colored_color1=210
wlcRainbowPrompt_256Colored_color2=216
wlcRainbowPrompt_256Colored_color3=229
wlcRainbowPrompt_256Colored_color4=120
wlcRainbowPrompt_256Colored_color5=49
wlcRainbowPrompt_256Colored_color6=87
wlcRainbowPrompt_256Colored_color7=45
wlcRainbowPrompt_256Colored_color8=39
wlcRainbowPrompt_256Colored_color9=69
wlcRainbowPrompt_256Colored_color10=63
wlcRainbowPrompt_256Colored_gitBranchInfoColor1=219 # for prompt whos colors are in background
wlcRainbowPrompt_256Colored_gitBranchInfoColor2=223 # for prompt whos colors are in texts
wlcRainbowPrompt_256Colored_gitBranchInfoBracketsColor=246

function wlc-setup-rainbow-prompt {
	function build_rainbow_prompt_with_git_branch_info_in_256_colors_and_make_colors_in_background {
		PS1=`clear-color`"\n"                                                                # New line

		PS1=$PS1"\e[38;5;16;48;5;${wlcRainbowPrompt_256Colored_color1}m`date +"%m-%d"`"        # Month & Day
		PS1=$PS1"\e[38;5;16;48;5;${wlcRainbowPrompt_256Colored_color2}m "                      # A <Space>
		PS1=$PS1"\e[38;5;16;48;5;${wlcRainbowPrompt_256Colored_color3}m`date +"%H:%M"`"        # Hour & Minute
		PS1=$PS1"\e[38;5;16;48;5;${wlcRainbowPrompt_256Colored_color4}m "                      # A <space>

		PS1=$PS1"\e[38;5;16;48;5;${wlcRainbowPrompt_256Colored_color5}m$(getCurrentUserName)"  # user
		PS1=$PS1"\e[38;5;16;48;5;${wlcRainbowPrompt_256Colored_color6}m@"                      # @
		PS1=$PS1"\e[38;5;16;48;5;${wlcRainbowPrompt_256Colored_color7}m\h"                     # host
		PS1=$PS1"\e[38;5;16;48;5;${wlcRainbowPrompt_256Colored_color8}m:"                      # :
		PS1=$PS1"\e[38;5;16;48;5;${wlcRainbowPrompt_256Colored_color9}m\w"                     # current working directory
		PS1=$PS1"\e[38;5;16;48;5;${wlcRainbowPrompt_256Colored_color10}m "                     # A <space>


		local gitBranchInfo=`__git_ps1`
		if [ ! -z "$gitBranchInfo" ]; then
			PS1=$PS1`clear-color`'\n'
			PS1=$PS1"\e[38;5;${wlcRainbowPrompt_256Colored_gitBranchInfoBracketsColor}m["
			PS1=$PS1"\e[38;5;${wlcRainbowPrompt_256Colored_gitBranchInfoColor1}m$gitBranchInfo"
			PS1=$PS1"\e[38;5;${wlcRainbowPrompt_256Colored_gitBranchInfoBracketsColor}m]"
		fi


		PS1=$PS1`clear-color`'\n'   # New line
		PS1=$PS1'> '                # last prompt sign: $<space>
		PS1=$PS1`clear-color`
	}

	function build_rainbow_prompt_with_git_branch_info_in_256_colors_and_make_colors_in_text {
		PS1=`clear-color`"\n"                                                                # New line

		PS1=$PS1"\e[38;5;${wlcRainbowPrompt_256Colored_color1}m`date +"%m-%d"`"        # Month & Day
		PS1=$PS1"\e[38;5;${wlcRainbowPrompt_256Colored_color2}m "                      # A <Space>
		PS1=$PS1"\e[38;5;${wlcRainbowPrompt_256Colored_color3}m`date +"%H:%M"`"        # Hour & Minute
		PS1=$PS1"\e[38;5;${wlcRainbowPrompt_256Colored_color4}m "                      # A <space>

		PS1=$PS1"\e[38;5;${wlcRainbowPrompt_256Colored_color5}m$(getCurrentUserName)"  # user
		PS1=$PS1"\e[38;5;${wlcRainbowPrompt_256Colored_color6}m@"                      # @
		PS1=$PS1"\e[38;5;${wlcRainbowPrompt_256Colored_color7}m\h"                     # host
		PS1=$PS1"\e[38;5;${wlcRainbowPrompt_256Colored_color8}m:"                      # :
		PS1=$PS1"\e[38;5;${wlcRainbowPrompt_256Colored_color9}m\w"                     # current working directory
		PS1=$PS1"\e[38;5;${wlcRainbowPrompt_256Colored_color10}m "                     # A <space>


		local gitBranchInfo=`__git_ps1`
		if [ ! -z "$gitBranchInfo" ]; then
			PS1=$PS1`clear-color`'\n'
			PS1=$PS1"\e[38;5;${wlcRainbowPrompt_256Colored_gitBranchInfoBracketsColor}m["
			PS1=$PS1"\e[38;5;${wlcRainbowPrompt_256Colored_gitBranchInfoColor2}m$gitBranchInfo"
			PS1=$PS1"\e[38;5;${wlcRainbowPrompt_256Colored_gitBranchInfoBracketsColor}m]"
		fi


		PS1=$PS1`clear-color`'\n'   # New line
		PS1=$PS1'> '                # last prompt sign: $<space>
		PS1=$PS1`clear-color`
	}

	function build_rainbow_prompt_with_git_branch_info_in_16_colors_and_make_colors_in_background {
		PS1=`clear-color`"\n"                                         # New line

		local timestampe=`date +"%m-%d %H:%M"`
		PS1=$PS1`colorful "$timestampe" textBrightBlack`" "           # timestamp

		local userName=`getCurrentUserName`
		PS1=$PS1`colorful "$userName"  textBlack       bgndCyan`      # user
		PS1=$PS1`colorful @            textBlack       bgndGreen`     # @
		PS1=$PS1`colorful '\h'         textBlack       bgndYellow`    # host
		PS1=$PS1`colorful :            textBrightBlack bgndBrightRed` # :
		PS1=$PS1`colorful '\w'         textBlack       bgndMagenta`   # current working directory


		local gitBranchInfo=`__git_ps1`

		if [ ! -z "$gitBranchInfo" ]; then
			PS1=$PS1`clear-color`'\n'
			PS1=$PS1`colorful '['              textBrightBlack`
			PS1=$PS1`colorful "$gitBranchInfo" textGreen`
			PS1=$PS1`colorful ']'              textBrightBlack`
		fi


		PS1=$PS1`clear-color`'\n'
		PS1=$PS1'> '                                                  # last prompt sign: $<space>
		PS1=$PS1`clear-color`
	}

	function build_rainbow_prompt_with_git_branch_info_in_16_colors_and_make_colors_in_text {
		PS1=`clear-color`"\n"                                 # New line

		local timestampe=`date +"%m-%d %H:%M"`
		PS1=$PS1`colorful "$timestampe" textBrightBlack`" "   # timestamp

		local userName=`getCurrentUserName`
		PS1=$PS1`colorful "$userName"  textCyan`              # user
		PS1=$PS1`colorful @            textGreen`             # @
		PS1=$PS1`colorful '\h'         textYellow`            # host
		PS1=$PS1`colorful :            textBrightRed`         # :
		PS1=$PS1`colorful '\w'         textMagenta`           # current working directory


		local gitBranchInfo=`__git_ps1`

		if [ ! -z "$gitBranchInfo" ]; then
			PS1=$PS1`clear-color`'\n'
			PS1=$PS1`colorful '['              textBrightBlack`
			PS1=$PS1`colorful "$gitBranchInfo" textGreen`
			PS1=$PS1`colorful ']'              textBrightBlack`
		fi


		PS1=$PS1`clear-color`'\n'
		PS1=$PS1'> '                                          # last prompt sign: $<space>
		PS1=$PS1`clear-color`
	}






	local tempShouldTryLoadGNU__git_ps1=1

	if [ -z "$shouldUseDetailedButSlowBranchInfoQueryInPrompt" ]; then
		shouldUseDetailedButSlowBranchInfoQueryInPrompt="no"
	fi

	if [ $shouldUseDetailedButSlowBranchInfoQueryInPrompt != "yes" ]; then
		tempShouldTryLoadGNU__git_ps1=0
	fi

	if [ $tempShouldTryLoadGNU__git_ps1 -eq 1 ] && [ -f "$rainbowPromptToolRootFolder/GNU-tools/git-prompt.sh" ]; then
		source "$rainbowPromptToolRootFolder/GNU-tools/git-prompt.sh";
	fi

	local fountThe__git_ps1_function=`declare -f __git_ps1 > /dev/null; echo $?`

	if [ $fountThe__git_ps1_function -ne 0 ]; then
		# echo "Use simplified __git_ps1"
		function __git_ps1 { # This is a simplified version of __git_ps1 if we have no GNU source code.
			git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
		}
	else
		echo "Use Detailed __git_ps1. Licensed under GNU GPL 2.0"
	fi





	local shouldUse16ColorsPrompt=0
	[ ${wlcRainbowPromptColorsAreInBackgroundButNotTexts:='yes'} ]





	if [ $envIsLinux = 1 ] || [ $envIsCygwin = 1 ] || [ $envIsGitBash = 1 ]; then
		shouldUse16ColorsPrompt=0
	else
		local tputColorsCount=`tput colors`
		if [ $tputColorsCount = 8 ]; then
			shouldUse16ColorsPrompt=1
		fi
	fi

	if [ $envIsVSCode = 1 ]; then
		shouldUse16ColorsPrompt=1
	fi





	if [ $shouldUse16ColorsPrompt = 1 ]; then
		if [ $wlcRainbowPromptColorsAreInBackgroundButNotTexts = yes ]; then
			export PROMPT_COMMAND='build_rainbow_prompt_with_git_branch_info_in_16_colors_and_make_colors_in_background';
		else
			export PROMPT_COMMAND='build_rainbow_prompt_with_git_branch_info_in_16_colors_and_make_colors_in_text';
		fi
	else
		if [ $wlcRainbowPromptColorsAreInBackgroundButNotTexts = yes ]; then
			export PROMPT_COMMAND='build_rainbow_prompt_with_git_branch_info_in_256_colors_and_make_colors_in_background'
		else
			export PROMPT_COMMAND='build_rainbow_prompt_with_git_branch_info_in_256_colors_and_make_colors_in_text'
		fi
	fi
}
