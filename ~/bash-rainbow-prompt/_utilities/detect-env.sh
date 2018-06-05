function getCurrentUserName {
    local currentUserName=$USERNAME

    if [ -z "$USERNAME" ]; then
        currentUserName=`whoami`
    fi

    echo $currentUserName
}

function detectEnv {
    export envIsWSL=0
    export envIsLinux=0
    export envIsCygwin=0
    export envIsGitBash=0
    export envIsVSCode=0


    if [[ `uname -a` =~ Linux.*Microsoft ]]; then
        envIsWSL=1
    elif [ `uname` = Linux ]; then
        envIsLinux=1
    elif [[ `uname` =~ CYGWIN_NT ]]; then
        envIsCygwin=1
    elif [[ `uname` =~ MINGW64_NT ]]; then
        envIsGitBash=1
    fi

    local termProgram=`echo $TERM_PROGRAM`

    if [ ! -z "$termProgram" ]; then
        if [ $termProgram = vscode ]; then
            envIsVSCode=1
        fi
    fi
}



detectEnv
