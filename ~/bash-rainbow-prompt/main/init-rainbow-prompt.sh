source "$___rainbowPromptToolRootFolder/main/define-rainbow-prompt.sh"

___shouldUse16ColorsPrompt=0
if [ $envIsLinux = 1 ] || [ $envIsCygwin = 1 ] || [ $envIsGitBash = 1 ]; then
    ___shouldUse16ColorsPrompt=0
else
    ___tputColors=`tput colors`
    if [ $___tputColors = 8 ]; then
        ___shouldUse16ColorsPrompt=1
    fi
    unset ___tputColors
fi

if [ $___shouldUse16ColorsPrompt = 1 ]; then
    export PROMPT_COMMAND='_customize_prompt_with_git_branch_info_in_16_colors_';
else
    export PROMPT_COMMAND='_customize_prompt_with_git_branch_info_in_256_colors_'
fi

unset ___shouldUse16ColorsPrompt