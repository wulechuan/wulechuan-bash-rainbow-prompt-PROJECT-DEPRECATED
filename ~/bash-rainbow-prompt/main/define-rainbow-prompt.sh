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
wlcRainbowPrompt_256Colored_gitBranchInfoColor1=219 # for prompt whose colors are in background
wlcRainbowPrompt_256Colored_gitBranchInfoColor2=223 # for prompt whose colors are in texts
wlcRainbowPrompt_256Colored_gitBranchInfoBracketsColor=246

function wlc-setup-rainbow-prompt {
	function build_rainbow_prompt_with_git_branch_info--in_256_colored_mode--and_set_colors_to_background {
		PS1=$clearColor'\n'                                                                    # New line


		PS1=$PS1'\[\033[38;5;16;48;5;'${wlcRainbowPrompt_256Colored_color1}'m\]'$(date +"%m-%d")       # Month & Day
		PS1=$PS1'\[\033[38;5;16;48;5;'${wlcRainbowPrompt_256Colored_color2}'m\]'' '                    # A <Space>
		PS1=$PS1'\[\033[38;5;16;48;5;'${wlcRainbowPrompt_256Colored_color3}'m\]'$(date +"%H:%M:%S")    # Hour & Minute
		PS1=$PS1'\[\033[38;5;16;48;5;'${wlcRainbowPrompt_256Colored_color4}'m\]'' '                    # A <space>

		PS1=$PS1'\[\033[38;5;16;48;5;'${wlcRainbowPrompt_256Colored_color5}'m\]'$(getCurrentUserName)  # user
		PS1=$PS1'\[\033[38;5;16;48;5;'${wlcRainbowPrompt_256Colored_color6}'m\]''@'                    # @
		PS1=$PS1'\[\033[38;5;16;48;5;'${wlcRainbowPrompt_256Colored_color7}'m\]''\h'                   # host
		PS1=$PS1'\[\033[38;5;16;48;5;'${wlcRainbowPrompt_256Colored_color8}'m\]'':'                    # :
		PS1=$PS1'\[\033[38;5;16;48;5;'${wlcRainbowPrompt_256Colored_color9}'m\]''\w'                   # current working directory
		PS1=$PS1'\[\033[38;5;16;48;5;'${wlcRainbowPrompt_256Colored_color10}'m\]'' '                   # A <space>


		local gitBranchInfo=`__git_ps1`
		if [ $shouldUseDetailedButSlowBranchInfoQueryInPrompt = yes ]; then
			gitBranchInfo=${gitBranchInfo:2:-1}
		fi

		if [ ! -z "$gitBranchInfo" ]; then
			PS1=$PS1$clearColor'\n'
			PS1=$PS1'\[\033[38;5;'${wlcRainbowPrompt_256Colored_gitBranchInfoBracketsColor}'m\]''['
			PS1=$PS1'\[\033[38;5;'${wlcRainbowPrompt_256Colored_gitBranchInfoColor1}'m\]'$gitBranchInfo
			PS1=$PS1'\[\033[38;5;'${wlcRainbowPrompt_256Colored_gitBranchInfoBracketsColor}'m\]'']'
		fi


		PS1=$PS1$clearColor'\n'   # New line
		PS1=$PS1'$ '              # last prompt sign: $<space>
	}

	function build_rainbow_prompt_with_git_branch_info--in_256_colored_mode--and_set_colors_to_text {
		PS1=$clearColor'\n'                                                            # New line

		PS1=$PS1'\[\033[38;5;'${wlcRainbowPrompt_256Colored_color1}'m\]'$(date +"%m-%d")        # Month & Day
		PS1=$PS1'\[\033[38;5;'${wlcRainbowPrompt_256Colored_color2}'m\]'' '                     # A <Space>
		PS1=$PS1'\[\033[38;5;'${wlcRainbowPrompt_256Colored_color3}'m\]'$(date +"%H:%M:%S")     # Hour & Minute
		PS1=$PS1'\[\033[38;5;'${wlcRainbowPrompt_256Colored_color4}'m\]'' '                     # A <space>

		PS1=$PS1'\[\033[38;5;'${wlcRainbowPrompt_256Colored_color5}'m\]'$(getCurrentUserName)   # user
		PS1=$PS1'\[\033[38;5;'${wlcRainbowPrompt_256Colored_color6}'m\]''@'                     # @
		PS1=$PS1'\[\033[38;5;'${wlcRainbowPrompt_256Colored_color7}'m\]''\h'                    # host
		PS1=$PS1'\[\033[38;5;'${wlcRainbowPrompt_256Colored_color8}'m\]'':'                     # :
		PS1=$PS1'\[\033[38;5;'${wlcRainbowPrompt_256Colored_color9}'m\]''\w'                    # current working directory
		PS1=$PS1'\[\033[38;5;'${wlcRainbowPrompt_256Colored_color10}'m\]'' '                    # A <space>


		local gitBranchInfo=`__git_ps1`
		if [ $shouldUseDetailedButSlowBranchInfoQueryInPrompt = yes ]; then
			gitBranchInfo=${gitBranchInfo:2:-1}
		fi

		if [ ! -z "$gitBranchInfo" ]; then
			PS1=$PS1$clearColor'\n'
			PS1=$PS1'\[\033[38;5;'${wlcRainbowPrompt_256Colored_gitBranchInfoBracketsColor}'m\]''['
			PS1=$PS1'\[\033[38;5;'${wlcRainbowPrompt_256Colored_gitBranchInfoColor2}'m\]'$gitBranchInfo
			PS1=$PS1'\[\033[38;5;'${wlcRainbowPrompt_256Colored_gitBranchInfoBracketsColor}'m\]'']'
		fi


		PS1=$PS1$clearColor'\n'   # New line
		PS1=$PS1'$ '              # last prompt sign: $<space>
	}

	function build_rainbow_prompt_with_git_branch_info--in_16_colored_mode--and_set_colors_to_background {
		PS1=$clearColor'\n'                                                                    # New line


		local dateString=$(date +"%m-%d")
		local clockString=$(date +"%H:%M:%S")
		local userName=`getCurrentUserName`
		local computerName=`hostname`
		local currentFolder='\w'

		PS1="$PS1"$(
			colorful "$dateString "      textBlack    bgndRed
			colorful "$clockString "     textBlack    bgndBrightRed
			colorful "$userName"         textBlack    bgndYellow
			colorful '@'                 textBlack    bgndGreen
			colorful "$computerName"     textBlack    bgndCyan
			colorful ':'                 textBlack    bgndBrightBlue
			colorful "$currentFolder"    textBlack    bgndMagenta
		)

		local gitBranchInfo=`__git_ps1`
		if [ $shouldUseDetailedButSlowBranchInfoQueryInPrompt = yes ]; then
			gitBranchInfo=${gitBranchInfo:2:-1}
		fi

		if [ ! -z "$gitBranchInfo" ]; then
			PS1="$PS1\n"$(
				colorful '['                 textBrightBlack
				colorful "$gitBranchInfo"    textGreen
				colorful ']'                 textBrightBlack
			)
		fi

		PS1="$PS1\n\$ "
	}

	function build_rainbow_prompt_with_git_branch_info--in_16_colored_mode--and_set_colors_to_text {
		PS1=$clearColor'\n'                                                                    # New line


		local dateString=$(date +"%m-%d")
		local clockString=$(date +"%H:%M:%S")
		local userName=`getCurrentUserName`
		local computerName=`hostname`
		local currentFolder='\w'

		PS1="$PS1"$(
			colorful "$dateString "      textRed
			colorful "$clockString "     textBrightRed
			colorful "$userName"         textYellow
			colorful '@'                 textGreen
			colorful "$computerName"     textCyan
			colorful ':'                 textBrightBlue
			colorful "$currentFolder"    textMagenta
		)

		local gitBranchInfo=`__git_ps1`
		if [ $shouldUseDetailedButSlowBranchInfoQueryInPrompt = yes ]; then
			gitBranchInfo=${gitBranchInfo:2:-1}
		fi

		if [ ! -z "$gitBranchInfo" ]; then
			PS1="$PS1\n"$(
				colorful '['                 textBrightBlack
				colorful "$gitBranchInfo"    textGreen
				colorful ']'                 textBrightBlack
			)
		fi

		PS1="$PS1\n\$ "
	}





	local tempShouldTryLoadGNU__git_ps1=1

	if [ -z "$shouldUseDetailedButSlowBranchInfoQueryInPrompt" ]; then
		shouldUseDetailedButSlowBranchInfoQueryInPrompt="no"
	fi


	if [ $shouldUseDetailedButSlowBranchInfoQueryInPrompt != "yes" ]; then
		tempShouldTryLoadGNU__git_ps1=0
	fi

	if [ $tempShouldTryLoadGNU__git_ps1 -eq 1 ] && [ -f "$wlcRainbowPromptToolRootFolder/GNU-tools/git-prompt.sh" ]; then
		source "$wlcRainbowPromptToolRootFolder/GNU-tools/git-prompt.sh";
	fi

	local foundThe__git_ps1_function=`declare -f __git_ps1 > /dev/null; echo $?`

	if [ $foundThe__git_ps1_function -ne 0 ]; then
		function __git_ps1 { # This is a simplified version of __git_ps1 if we have no GNU source code.
			git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
		}
	else
		if [[ "$-" =~ i ]]; then
			echo "Use Detailed __git_ps1, which is licensed under GNU GPL 2.0"
		fi
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





	if [ $shouldUse16ColorsPrompt -eq 1 ]; then
		if [ $wlcRainbowPromptColorsAreInBackgroundButNotTexts = yes ]; then
			export PROMPT_COMMAND='build_rainbow_prompt_with_git_branch_info--in_16_colored_mode--and_set_colors_to_background';
		else
			export PROMPT_COMMAND='build_rainbow_prompt_with_git_branch_info--in_16_colored_mode--and_set_colors_to_text';
		fi
	else
		if [ $wlcRainbowPromptColorsAreInBackgroundButNotTexts = yes ]; then
			export PROMPT_COMMAND='build_rainbow_prompt_with_git_branch_info--in_256_colored_mode--and_set_colors_to_background'
		else
			export PROMPT_COMMAND='build_rainbow_prompt_with_git_branch_info--in_256_colored_mode--and_set_colors_to_text'
		fi
	fi
}
