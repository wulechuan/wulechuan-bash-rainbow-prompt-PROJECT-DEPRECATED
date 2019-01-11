# See https://github.com/wulechuan/bash-colorful-strings

clearColor='\e[0m'

function colorful {
    local endChar
    if   [ "$1" == '--' ]; then
        shift
    elif [ "$1" == '-n' ]; then
        endChar='\n'
        shift
    fi



    if [ $# -eq 0 ]; then
        return 0
    fi



    local rawString="$1"
    shift



    local colorEscapeString
    get-echo-color    $*    colorEscapeString



    local clearColorMark
    if [ -z "$colorEscapeString" ]; then
        clearColorMark=''          # 故意不做【清除颜色】的动作
    else
        clearColorMark=$clearColor # 应该清除颜色
    fi



    echo -en "${colorEscapeString}${rawString}${clearColorMark}${endChar}"
}

function get-echo-color {
    local color1=
    local color2=

    if [ $# -lt 2 ]; then # Too few arguments. At least 2 arguments are required.
        return
    fi


    map-color-name-into-ansi-code-via-if-statements       $1   color1


    if [ $# -eq 2 ]; then
        if [ ! -z "$color1" ]; then
            eval "$2='\\'\"e[${color1}m\""
        fi
    else
        map-color-name-into-ansi-code-via-if-statements   $2   color2

        if [ ! -z "$color1" ] && [ ! -z "$color2" ]; then
            eval "$3='\\'\"e[${color1};${color2}m\""

        elif [ ! -z "$color1" ] || [ ! -z "$color2" ]; then
            # There is no ';' below, because either of the colors will simply be empty.
            eval "$3='\\'\"e[${color1}${color2}m\""
        fi
    fi
}

function set-echo-color {
    local colorEscapeString
    get-echo-color $* colorEscapeString
    echo -e "$colorEscapeString"
}

function clear-echo-color {
    echo -en $clearColor
}

function map-color-name-into-ansi-code-via-if-statements {
    if [ -z "$1" ];                     then
        eval $2=''



    # classical foreground colors

    elif [ $1 == 'textBlack' ];         then
        eval $2=30

    elif [ $1 == 'textRed' ];           then
        eval $2=31

    elif [ $1 == 'textGreen' ];         then
        eval $2=32

    elif [ $1 == 'textYellow' ];        then
        eval $2=33

    elif [ $1 == 'textBlue' ];          then
        eval $2=34

    elif [ $1 == 'textMagenta' ];       then
        eval $2=35

    elif [ $1 == 'textCyan' ];          then
        eval $2=36

    elif [ $1 == 'textWhite' ];         then
        eval $2=37



    # classical background colors

    elif [ $1 == 'bgndBlack' ];         then
        eval $2=40

    elif [ $1 == 'bgndRed' ];           then
        eval $2=41

    elif [ $1 == 'bgndGreen' ];         then
        eval $2=42

    elif [ $1 == 'bgndYellow' ];        then
        eval $2=43

    elif [ $1 == 'bgndBlue' ];          then
        eval $2=44

    elif [ $1 == 'bgndMagenta' ];       then
        eval $2=45

    elif [ $1 == 'bgndCyan' ];          then
        eval $2=46

    elif [ $1 == 'bgndWhite' ];         then
        eval $2=47



    # morden foreground colors
    # modern colors are **not** supported by Microsoft VSCode terminal

    elif [ $1 == 'textBrightBlack' ];   then
        eval $2=90

    elif [ $1 == 'textBrightRed' ];     then
        eval $2=91

    elif [ $1 == 'textBrightGreen' ];   then
        eval $2=92

    elif [ $1 == 'textBrightYellow' ];  then
        eval $2=99

    elif [ $1 == 'textBrightBlue' ];    then
        eval $2=94

    elif [ $1 == 'textBrightMagenta' ]; then
        eval $2=95

    elif [ $1 == 'textBrightCyan' ];    then
        eval $2=96

    elif [ $1 == 'textBrightWhite' ];   then
        eval $2=97



    # morden background colors
    # modern colors are **not** supported by Microsoft VSCode terminal

    elif [ $1 == 'bgndBrightBlack' ];   then
        eval $2=100

    elif [ $1 == 'bgndBrightRed' ];     then
        eval $2=101

    elif [ $1 == 'bgndBrightGreen' ];   then
        eval $2=102

    elif [ $1 == 'bgndBrightYellow' ];  then
        eval $2=103

    elif [ $1 == 'bgndBrightBlue' ];    then
        eval $2=104

    elif [ $1 == 'bgndBrightMagenta' ]; then
        eval $2=105

    elif [ $1 == 'bgndBrightCyan' ];    then
        eval $2=106

    elif [ $1 == 'bgndBrightWhite' ];   then
        eval $2=107


    else
        eval $2=''


    fi
}
