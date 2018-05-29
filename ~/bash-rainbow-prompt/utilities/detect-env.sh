function getCurrentUserName {
    local currentUserName=$USERNAME

    if [ -z "$USERNAME" ]; then
        currentUserName=`whoami`
    fi

    echo $currentUserName
}

function detectEnv {
    if [[ `uname -a` =~ Linux.*Microsoft ]]; then
        envIsWSL=1
    elif [ `uname` = Linux ]; then
        envIsLinux=1
    elif [[ `uname` =~ CYGWIN_NT ]]; then
        envIsCygwin=1
    elif [[ `uname` =~ MINGW64_NT ]]; then
        envIsGitBash=1
    fi
}

detectEnv