#!/bin/sh
# udevadm monitor --environment --udev
# specify the monitors to use
USERNAME=

# set some variables needed to control the x server
export XAUTHORITY=/home/$USERNAME/.Xauthority
export DISPLAY=:0.0

# functions to switch from internal screen to external screen and vice versa or to use both screens together
function docked {
    echo "Switching to docked" >> /home/tom/test.log
    xrandr --output VIRTUAL1 --off --output eDP1 --off --output DP1 --off --output HDMI2 --off --output HDMI1 --primary --mode 1920x1200 --pos 0x0 --rotate normal --output DP2 --off >> /home/tom/test.log 2>&1
}
function mobile {
    echo "Switching to mobile" >> /home/tom/test.log
xrandr --output VIRTUAL1 --off --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off >> /home/tom/test.log 2>&1
}
function both {
    echo "Switching to both" >> /home/tom/test.log
    xrandr --output VIRTUAL1 --off --output eDP1 --mode 1366x768 --pos 288x1200 --rotate normal --output DP1 --off --output HDMI2 --off --output HDMI1 --primary --mode 1920x1200 --pos 0x0 --rotate normal --output DP2 --off
 >> /home/tom/test.log 2>&1
}

# functions to check if external monitor is connected and in use
function externalConnected {
    ! xrandr | grep "^HDMI1" | grep disconnected >/dev/null
}
function lidOpen {
    ! cat /proc/acpi/button/lid/LID0/state | grep closed >/dev/null
}

# actual script
if externalConnected && lidOpen
then
    both
fi

if externalConnected && ! lidOpen
then
    docked
fi

if ! externalConnected && lidOpen
then
    mobile
fi
