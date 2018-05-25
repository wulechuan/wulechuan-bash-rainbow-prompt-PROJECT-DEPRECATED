___bashScriptsRootFolder=~/bash-rainbow-prompt # DO NOT QUOTE THIS VALUE!

source "$___bashScriptsRootFolder/source/utilities/ansi-colors.sh"
source "$___bashScriptsRootFolder/source/functions-prompt.sh"

# export PROMPT_COMMAND='_customize_prompt_with_git_branch_info_in_16_colors_'
export PROMPT_COMMAND='_customize_prompt_with_git_branch_info_in_256_colors_'

unset ___bashScriptsRootFolder