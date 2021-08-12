#!/bin/bash
CHOICE=$(echo "PowerOff|Logout|Reboot|Reboot to Windows 10|Restart Espanso service" | rofi -sep '|' -dmenu -i -p "Power Options")
if [ "$CHOICE" == "Reboot" ]
then
    # echo $CHOICE
    systemctl reboot
fi
if [ "$CHOICE" == "PowerOff" ]
then
    # echo $CHOICE
    systemctl poweroff
fi
if [ "$CHOICE" == "Reboot to Windows 10" ]
then
    # echo $CHOICE
    sudo efibootmgr --bootnext $(efibootmgr|grep -i windows|awk '{print substr($1,5,4)}')
    systemctl reboot
fi

if [ "$CHOICE" == "Logout" ]
then
    # echo $CHOICE
    i3-msg exit
    # python -c 'from libqtile.command_client import CommandClient;CommandClient().call("shutdown")()'
    # qtile-cmd -o cmd -f shutdown
fi
if [ "$CHOICE" == "Restart Espanso service" ]
then
    # echo $CHOICE
    espanso restart
fi
