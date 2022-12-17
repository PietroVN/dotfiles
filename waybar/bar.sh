#!/usr/bin/env sh
###################################
# Custom bar script		  #
# By: Waltz			  #
###################################

# Paths
song_name_path="$XDG_RUNTIME_DIR/music-name"
song_pause_path="$XDG_RUNTIME_DIR/music-paused"
mpv_socket_path="$XDG_RUNTIME_DIR/music-socket"

# Modules
modules="$@"

if [[ -z "$modules" ]]; then
	echo "Modules:"
	echo "- Clock"
	echo "- Calendar"
	echo "- Battery"
	echo "- Temperature"
	echo "- Music"
	echo "E.g: bar.sh day clock"
	exit 0
fi

# Functions
clock() {
	clock="$(date +%H:%M) "
}

calendar() {
	calendar="$(date +%d/%m/%y) "
}

battery() {
	battery="$(cat '/sys/class/power_supply/BAT0/capacity')% "
}

temperature() {
	temperature="$(sed s/000//g '/sys/class/hwmon/hwmon3/temp1_input')C "
}

music() {
	if [[ $(pgrep mpv) && $(file "$mpv_socket_path")  ]]; then

		# Cat title
		title_size="$(cat "$song_name_path" | awk '{print length}')"

		# Roll size (the max characters that will be visible at the same time)
		#roll_size="30"
		
		#
		roll_size="$title_size"
		roll_end="$title_size"

		# Initial values
		#[[ "$roll_end" -ge "$title_size" || -z "$roll_start" ]] && roll_start="1"
		#[[ "$roll_end" -ge "$title_size" || -z "$roll_end" ]] && roll_end="$roll_size"

		# Song name var (if paused song name will be exhibited with exclamation  prefix)
		[[ -f "$song_pause_path" ]] || music=" $(cut -b "$roll_start"-"$roll_end" "$song_name_path")"
		[[ -f "$song_pause_path" ]] && music=" $(cut -b "$roll_start"-"$roll_end" "$song_name_path")"

		# Make the roll effect
		#roll_start=$((roll_start + 1))
		#roll_end=$((roll_end + 1))
	else
		[[ -z "$music" ]] || unset music
	fi
}

# Main loop
while true; do

	# Load and update modules
	[[ "$modules" == *"music"*        ]] && music
	[[ "$modules" == *"clock"*        ]] && clock
	[[ "$modules" == *"calendar"*     ]] && calendar
	[[ "$modules" == *"battery"*      ]] && battery
	[[ "$modules" == *"temperature"*  ]] && temperature

	# All
	if [[ "$modules" == "all" ]];then
		music
		clock
		day
		battery
		temp
	fi

	# Print modules
	echo "$clock$calendar$battery$temperature$music"

	# Wait 1 second
	sleep 1
done
