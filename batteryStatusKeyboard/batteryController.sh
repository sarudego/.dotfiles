#!/bin/bash
# here the battery capacity /sys/class/power_supply/BAT0/capacity

export XDG_RUNTIME_DIR="/run/user/1000"
export DISPLAY=:0

BAT=$(/usr/bin/cat /sys/class/power_supply/BAT1/capacity)
STAT=$(/usr/bin/cat /sys/class/power_supply/BAT1/status)

if [ $BAT -lt 30 ] && [ $STAT == "Discharging" ]
then
    /usr/bin/notify-send -u normal -t 3000 "Battery low!!"
    /usr/bin/aplay $HOME/Documents/batteryStatusKeyboard/anyonethere.wav >> /dev/null 2>&1
fi

if [ $BAT -lt 10 ] && [ $STAT == "Discharging" ]
then
    /usr/bin/notify-send -u critical -t 3000 "Battery really low!!"
    /usr/bin/aplay $HOME/Documents/batteryStatusKeyboard/hello.wav >> /dev/null 2>&1
fi

if [ $BAT -eq 3 ] && [ $STAT == "Discharging" ]
then
    /usr/bin/notify-send -u critical -t 1000 "Suspending!!"
    /usr/bin/systemctl suspend
    /usr/bin/aplay $HOME/Documents/batteryStatusKeyboard/shutdown.wav >> /dev/null 2>&1
fi

