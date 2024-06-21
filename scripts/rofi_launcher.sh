#!/usr/bin/env sh

save_dir="$HOME/nix/swww"
wall_dir="$HOME/Pictures/wallpapers"

help_menu() {
	echo "$0" commands:
	echo
	echo -h, --help : Shows the help menu
	echo -w, --wallpaper : Sets wallpaper and the pywal
}


wall() {
  if [ ! -f "${wall_dir}/${wallpaper_location}" ]; then
    echo The file doesn\'t exist
    exit 1
  fi

	ln -fs "${wall_dir}/${wallpaper_location}" "${save_dir}/wall.set"

	wal -i "${wall_dir}/${wallpaper_location}" > /dev/null

	swww img "${save_dir}/wall.set"

	pywalfox update

	sleep 1
	pkill waybar
	sleep 1

	waybar > /dev/null &
}

case "$1" in
	-wall | --wallpaper)
		# List all the wallpapers
		wallpaper_location="$(ls "${wall_dir}" | rofi -dmenu -hover-select -me-select-entry '' -me-accept-entry- MousePrimary)"
		wall
		;;
	-d | --drun)
		rofi -show drun
		;;
	-w | --window)
		rofi -show window
		;;
	-f | --file-browser)
		rofi -show filebrowser
		;;
	-h | --help)
		help_menu
		;;
	*)
		help_menu
		;;
esac
