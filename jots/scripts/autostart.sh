#!/bin/bash

echo "1) Wayland"
echo "2) X11"

read -p "What Do You Pick: " chodis

echo "1) Hyprland"
echo "2) KDE Wayland/X11"
echo "3) Exit To TTY"

read -p 'What Do You Pick: ' chodewm

case "$chodewm" in
    1)
        hyprland
        ;;
    2)
        case "$chodis" in
            1)
                startplasma-wayland
                ;;
            2)
                startplasma-x11
                ;;
        esac
        ;;
    3)
        exit
        ;;
    *)
        echo "Invalid"
        ;;
esac
