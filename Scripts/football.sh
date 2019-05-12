#!/bin/bash

# copy from https://github.com/andrewleech/plugin.video.netflixbmc/blob/master/browser.sh

# Managed to resolve the issues with, but will leave this here anyway, as its a good fallback
#CHROME_STARTED=`ps -ef | grep chromium-browser | grep -v "grep" | wc -l`
#if [ $CHROME_STARTED -gt 0 ]; then
        #exit 1;
#fi
USERNAME=tom 
 
# set some variables needed to control the x server 
export XAUTHORITY=/home/$USERNAME/.Xauthority 
export DISPLAY=:1.0

# lets find out if xdotool actually exist before we try to call them.
command -v xdotool >/dev/null 2>&1
XDOTOOL=$?
source /home/tom/Scripts/mute-application.sh
MUTE_SCRIPT=/home/tom/Scripts/mute-application.sh

type=$1

# notice the ampersand to send google chrome into back ground so that the script continues and we execute the xdotool below
#/usr/bin/chromium-browser --start-maximized --disable-translate --disable-new-tab-first-run --no-default-browser-check --no-first-run --kiosk "$url" &
CHROME_PID=$!
#if [$url = "firefox"]; then
    #xdotool search --sync --onlyvisible --class firefox windowactivate
#else
    #echo "Nope"
#fi
#if [ $XDOTOOL -eq 0 ]; then
if [ $type == "Firefox" ]; then
        # no point sleeping if xdotool is not installed.
        echo "Switching to firefox" >> /home/tom/test.log 
        /bin/bash $MUTE_SCRIPT -u "firefox"
        /bin/bash $MUTE_SCRIPT "chromium"
        /bin/bash $MUTE_SCRIPT "kodi-x11"
        /bin/bash $MUTE_SCRIPT "mpv"
        xdotool search --sync --onlyvisible --class firefox windowactivate >> /home/tom/test.log 2>&1 
        ##mute other two
elif [ $type == "Chromium" ]; then
        echo "Switching to chrome" >> /home/tom/test.log 
        /bin/bash $MUTE_SCRIPT -u "chromium"
        /bin/bash $MUTE_SCRIPT "firefox"
        /bin/bash $MUTE_SCRIPT "kodi-x11"
        /bin/bash $MUTE_SCRIPT "mpv"
        #xdotool search --sync --onlyvisible --class chromium windowactivate >> /home/tom/test.log 2>&1 
        xdotool key "Super_L+2"
        #mute other two
elif [ $type == "Kodi" ]; then
        echo "Switching to Kodi" >> /home/tom/test.log 
        /bin/bash $MUTE_SCRIPT -u "kodi-x11"
        /bin/bash $MUTE_SCRIPT "chromium"
        /bin/bash $MUTE_SCRIPT "firefox"
        /bin/bash $MUTE_SCRIPT "mpv"
        xdotool key "Super_L+1"
        #xdotool search --sync --onlyvisible --class kodi-x11 windowactivate >> /home/tom/test.log 2>&1 
        #mute other two
        #xdotool mousemove 9999 9999 click 1
elif [ $type == "mpv" ]; then
        echo "Switching to mpv" >> /home/tom/test.log 
        /bin/bash $MUTE_SCRIPT -u "mpv"
        /bin/bash $MUTE_SCRIPT "chromium"
        /bin/bash $MUTE_SCRIPT "firefox"
        /bin/bash $MUTE_SCRIPT "kodi-x11"
        xdotool key "Super_L+5"
        #xdotool search --sync --onlyvisible --class kodi-x11 windowactivate >> /home/tom/test.log 2>&1 
        #mute other two
        #xdotool mousemove 9999 9999 click 1

else
        echo "Please provide Chromium or Kodi as args"
fi
# wait for google-chrome to be killed 
wait $CHROME_PID

