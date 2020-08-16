#!/bin/bash

rofi_command="rofi -theme themes/scrotmenu.rasi"

### Options ###
screen=""
area=""
window=""
# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
# case $chosen in
#     $screen)
#         sleep 1; scrot
#         ;;
#     $area)
#         scrot -s
#         ;;
#     $window)
#         sleep 1; scrot -u
#         ;;
# esac
case $chosen in
    $screen)
        sleep 1;
	maim --format png /dev/stdout|xclip -selection clipboard -t image/png -i;
        ;;
    $area)
	maim -s --format png /dev/stdout|xclip -selection clipboard -t image/png -i;
        ;;
    $window)
        sleep 1;
	maim -st 9999999 --format png|xclip -selection clipboard -t image/png -i;
        ;;
esac

