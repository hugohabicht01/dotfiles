#!/usr/bin/env bash

# TODO: Still not working, this might help: https://www.reddit.com/r/swaywm/comments/gb6per/swaygrab1_an_easy_to_use_screenshot_tool_for_sway/
## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/applets/style.sh)"

dir="$HOME/.config/rofi/applets/applets/configs/$style"
rofi_command="rofi -theme $dir/screenshot.rasi"

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "Please install 'scrot' first."
}

# Options
screen=""
area=""
window=""

# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -p 'scrot' -dmenu -selected-row 1)"
case $chosen in
    $screen)
		if [[ -f /usr/bin/maim ]]; then
			sleep 1; maim /tmp/screenshot.jpg && wl-copy < /tmp/screenshot.jpg
                else
			msg
		fi
        ;;
    $area)
		if [[ -f /usr/bin/scrot ]]; then
			maim -s /tmp/screenshot.jpg && wl-copy < /tmp/screenshot.jpg
		else
			msg
		fi
        ;;
    $window)
		if [[ -f /usr/bin/scrot ]]; then
			sleep 1; scrot -u 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES) ; viewnior $$(xdg-user-dir PICTURES)/$f'
		else
			msg
		fi
        ;;
esac

