#!/bin/bash
###################################
# Custom bar script		  #
# By: Waltz			  #
###################################

# Paths
song_name_path="$XDG_RUNTIME_DIR/name"
song_pause_path="$XDG_RUNTIME_DIR/music-paused"
mpv_socket_path="$XDG_RUNTIME_DIR/music-socket"

# Functions
clock() {
	time="$(date +%H:%M)"
}

day() {
	day=" | $(date +%d/%m/%y)"
}

battery() {
	battery=" | $(echo "$(cat "/sys/class/power_supply/BAT0/capacity")%")"
}

temp() {
	temp=" | $(echo "$(sed s/000//g /sys/class/hwmon/hwmon3/temp1_input)C")"
}

music() {
	if [[ $(pgrep mpv) && $(file "$mpv_socket_path")  ]]; then

		# Cat title
		title_size="$(cat "$song_name_path" | awk '{print length}')"

		# Roll size (the max characters that will be visible at the same time)
		roll_size="30"

		# Initial values
		[[ "$roll_end" -ge "title_size" || -z "$roll_start" ]] && roll_start="1"
		[[ "$roll_end" -ge "title_size" || -z "$roll_end" ]] && roll_end="$roll_size"

		# Song name var (if paused song name will be exhibited with exclamation  prefix)
		[[ $(cat "$song_pause_path") == "no" || $(cat "$song_pause_path" | wc -l) ]] && song=" | $(cut -b "$roll_start"-"$roll_end" "$song_name_path")"
		[[ $(cat "$song_pause_path") == "yes" ]] && song=" | !$(cut -b "$roll_start"-"$roll_end" "$song_name_path")"

		# Make the roll effect
		roll_start=$((roll_start + 1))
		roll_end=$((roll_end + 1))
	else
		[[ -z "$song" ]] || unset song
	fi
}

# Main loop
while true; do
	music
	clock
	day
	battery
	temp

	# Set root window title
	echo "$time$day$battery$temp$song"

	# Wait 1 second
	sleep 1
done
