#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    printf "\0prompt\x1fpower\n"
    printf "\0no-custom\x1ftrue\n"
    printf "\0theme\x1felement { children: [element-text]; } listview { lines: 1; columns: 5; }\n"

    printf "Lock\0display\x1f Lock\n"
    printf "Sleep\0display\x1f󰤄 Sleep\n"
    printf "Log Out\0display\x1f󰍃 Log Out\n"
    printf "Reboot\0display\x1f Reboot\n"
    printf "Shutdown\0display\x1f Shutdown\n"
    exit 0
fi

case "$@" in
    "Lock") (sleep 0.1 && hyprlock) > /dev/null 2>&1 & disown ;;
    "Sleep") (sleep 0.1 && hyprlock & disown && systemctl suspend) > /dev/null 2>&1 ;;
    "Log Out") hyprctl dispatch 'hl.dsp.exit()' ;;
    "Reboot") reboot ;;
    "Shutdown") shutdown -h now ;;
esac
