#!/bin/bash

rofi_command="rofi -theme themes/mpdmenu.rasi"

### Options ###
# Gets the current status of mpd (for us to parse it later on)
# status="$(mpc status)"
status="$(spotifycli --playbackstatus)"
# Defines the Play / Pause option content
if [[ $status == *"Playing"* ]]; then
    play_pause=""
else
    play_pause=""
fi
active=""
urgent=""

stop=""
next=""
previous=""
# Variable passed to rofi
options="$previous\n$play_pause\n$stop\n$next"

# Get the current playing song
# current=$(mpc current)
current=$(spotifycli --status)
# If mpd isn't running it will return an empty string, we don't want to display that
if [[ -z "$current" ]]; then
    current="-"
fi

# Spawn the mpd menu with the "Play / Pause" entry selected by default
chosen="$(echo -e "$options" | $rofi_command -p "$current" -dmenu $active $urgent -selected-row 1)"
case $chosen in
    $previous)
        spotifycli --prev
        ;;
    $play_pause)
        spotifycli --playpause
        ;;
    $stop)
        spotifycli --pause
        ;;
    $next)
        spotifycli --next
        ;;
esac

