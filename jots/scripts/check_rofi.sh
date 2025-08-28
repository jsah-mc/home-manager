    pgrep rofi >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        exit
    else
        rofi -show drun
    fi
