#!/usr/bin/env sh


saveDir="${HOME}/Pictures/Screenshot"
saveFile="$(date +'%y%m%d_%Hh%Mm%Ss_screenshot.png')"
swpyDir="${HOME}/.config/swappy"
temp_screenshot="/tmp/screenshot.png"


mkdir -p $saveDir
mkdir -p $swpyDir

case "$1" in
p) # print all outputs
	grimblast copysave screen $temp_screenshot && swappy -f $temp_screenshot ;;
s) # drag to manually select a area / click on a window
  grimblast copysave area $temp_screenshot && swappy -f $temp_screenshot ;;
m) # print focused monitor
	grimblast copysave output $temp_screenshot && swappy -f $temp_screenshot ;;
*) # invalid option
	print_error ;;
esac

rm "$temp_screenshot"

if [ -f "${saveDir}/${saveFile}" ]; then
	notify-send -a "t1" -i "${saveDir}/${saveFile}" "saved in ${saveDir}"
fi
