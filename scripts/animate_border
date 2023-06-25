#/usr/bin/env bash

# Border color
col="$@"
border_angle=0

# Kill other instances
for pid in $(ps -ax | grep "scripts/animate_border" | grep -v "grep" | awk '{print $1}'); do
	[ ${pid} -eq $$ ] || kill -9 ${pid}
done

# Main Loop
while true; do

	# Hyprctl
	hyprctl --batch keyword general:col.active_border ""$col" "$border_angle"deg"

	# Increase border angle
	border_angle=$((border_angle + 1))

	# Delay
	sleep 0.05

	# Break
	[[ $(pgrep -f "animate_border" | wc -l) -ge 3 ]] && break
done
