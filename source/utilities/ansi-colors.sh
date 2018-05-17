function colorful {
    # Usage:
    # colorful "your string or $variable here" textBlack bgndCyan

    if [ -z "$1" ]; then
        return
    fi

    echo -e `set-color $2 $3`$1`clear-color`
}

function set-color {
    local color1=
    local color2=

    if [ -z "$1" ]; then
        return
    fi


    color1=$(map-color-name-into-ansi-code $1)

    if [ ! -z "$2" ]; then
        color2=";`map-color-name-into-ansi-code $2`"
    fi

    echo -e "\033[${color1}${color2}m"
}

function clear-color {
    echo -e "\033[0;0m";
}

function map-color-name-into-ansi-code() {
    if [ -z "$1" ]; then
        return



    # classical foreground colors

    elif [ $1 == 'textBlack' ]; then
        echo 30

    elif [ $1 == 'textRed' ]; then
        echo 31

    elif [ $1 == 'textGreen' ]; then
        echo 32

    elif [ $1 == 'textYellow' ]; then
        echo 33

    elif [ $1 == 'textBlue' ]; then
        echo 34

    elif [ $1 == 'textMagenta' ]; then
        echo 35

    elif [ $1 == 'textCyan' ]; then
        echo 36

    elif [ $1 == 'textWhite' ]; then
        echo 37



    # classical background colors

    elif [ $1 == 'bgndBlack' ]; then
        echo 40

    elif [ $1 == 'bgndRed' ]; then
        echo 41

    elif [ $1 == 'bgndGreen' ]; then
        echo 42

    elif [ $1 == 'bgndYellow' ]; then
        echo 43

    elif [ $1 == 'bgndBlue' ]; then
        echo 44

    elif [ $1 == 'bgndMagenta' ]; then
        echo 45

    elif [ $1 == 'bgndCyan' ]; then
        echo 46

    elif [ $1 == 'bgndWhite' ]; then
        echo 47



    # morden foreground colors

    elif [ $1 == 'textBrightBlack' ]; then
        echo 90

    elif [ $1 == 'textBrightRed' ]; then
        echo 91

    elif [ $1 == 'textBrightGreen' ]; then
        echo 92

    elif [ $1 == 'textBrightYellow' ]; then
        echo 99

    elif [ $1 == 'textBrightBlue' ]; then
        echo 94

    elif [ $1 == 'textBrightMagenta' ]; then
        echo 95

    elif [ $1 == 'textBrightCyan' ]; then
        echo 96

    elif [ $1 == 'textBrightWhite' ]; then
        echo 97



    # morden background colors

    elif [ $1 == 'bgndBrightBlack' ]; then
        echo 100

    elif [ $1 == 'bgndBrightRed' ]; then
        echo 101

    elif [ $1 == 'bgndBrightGreen' ]; then
        echo 102

    elif [ $1 == 'bgndBrightYellow' ]; then
        echo 103

    elif [ $1 == 'bgndBrightBlue' ]; then
        echo 1010

    elif [ $1 == 'bgndBrightMagenta' ]; then
        echo 105

    elif [ $1 == 'bgndBrightCyan' ]; then
        echo 106

    elif [ $1 == 'bgndBrightWhite' ]; then
        echo 107




    fi
}