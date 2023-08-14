#/usr/bin/env bash
#########################################################
# Script to manage wallpapers easily on the fly			#
# By: Waltz												#
#########################################################
# This script works by simply pointing hyprpaper to a	#
# temp config file, and then we update the contents and	#
# we run hyprland again so it can update the wallpaper	#
# and unload the previous								#
#########################################################
# Deps: Hyprpaper, Swaybg, Hyprland								#
#########################################################

# Config path (You can change this to hyprpaper.conf but be aware to backup your default config file!)
config="$HOME/.config/hypr/wallpaper_cli.conf"

# Receive image as an argument
image_path="$@"
monitor="eDP-1"
wallpaper_mngr="hyprpaper" # Hyprpaper / Swaybg

# Help menu
if [[ "$image_path" == *"-h"* ]]; then
	echo "Wallpaper CLI parameters:"
	echo "	--help - Help menu"
	echo "	Usage: wallpaper_cli <image_path>"
fi

# Start wallpaper_mngr if config file already exists
[[ "$wallpaper_mngr" == "hyprpaper" && -f "$config" && ! "$(pgrep hyprpaper)" ]] && hyprpaper --config "$config" &
[[ "$wallpaper_mngr" == "swaybg" && -f "$config" && ! "$(pgrep swaybg)" ]] && swaybg -i "$(cat $config)" &

# User hasn't passed any argument to script, don't have a config file
[[ -z "$image_path" && ! -f "$config" ]] && \
	echo "You don't have an config file, you'll need to set some image as wallpaper to create one" \
	exit 0

# Pick image from clipboard if we receive clipboard as image path (using wl-paste)
[[ "$image_path" == "clipboard" ]] && image_path="$(wl-paste)"

# Check if image exists
if [[ -f "$image_path" ]]; then

	if [[ "$wallpaper_mngr" == "hyprpaper" ]]; then
		# Save image to config file
		echo "preload = "$image_path"" > "$config"
		echo "wallpaper = "$monitor","$image_path"" >> "$config"

		# Unload all previous wallpaper
		hyprctl hyprpaper unload all

		# Set new wallpaper
		hyprctl hyprpaper preload "$image_path"
		hyprctl hyprpaper wallpaper "$monitor","$image_path"
	else
		killall "swaybg"
		echo "$image_path" > "$config"
		swaybg -i "$image_path" &
	fi
else
	echo "Inexistent image"
fi
