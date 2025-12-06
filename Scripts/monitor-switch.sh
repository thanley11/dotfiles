#!/bin/sh

# specify the monitors to use
USERNAME=tom

# set some variables needed to control the x server
export XAUTHORITY=/home/$USERNAME/.Xauthority
export DISPLAY=:0.0
choices="laptop\ndocked\nboth"
chosen=$(echo -e "$choices" | rofi -dmenu -i)

# functions to switch from internal screen to external screen and vice versa or to use both screens together
function docked {
    xrandr --output DP1-1 --primary --mode 1920x1200 --pos 1920x0 --rotate normal
    xrandr --output DP1-2 --mode 1920x1200 --pos 0x0 --rotate normal
    xrandr --output eDP1 --off
}

function laptop {
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
    xrandr --output DP1-1 --off
    xrandr --output DP1-2 --off
}

function both {
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x1200 --rotate normal
    xrandr --output DP1-1 --mode 1920x1200 --pos 1920x0 --rotate normal
    xrandr --output DP1-2 --mode 1920x1200 --pos 0x0 --rotate normal
}

# functions to check if external monitor is connected and in use
function externalConnected {
    ! xrandr | grep "^DP1-1" | grep disconnected >/dev/null
}

function lidOpen {
    ! cat /proc/acpi/button/lid/LID0/state | grep closed >/dev/null
}

# check if the correct number of arguments is provided
#if [ "$#" -ne 1 ]; then
    #echo "Usage: $0 {laptop|both|docked}"
    #exit 1
#fi

# actual script based on the parameter
case "$chosen" in
    laptop)
        laptop
        ;;
    both)
        both
        ;;
    docked)
        docked
        ;;
    *)
        echo "Invalid option: $1"
        exit 1
        ;;
esac
