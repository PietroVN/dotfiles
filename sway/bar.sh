#!/bin/bash

clock() {
	TIME=$(date +%H:%M)
}

day() {
	DAY=$(date +%d/%m/%y)
}

battery() {
	BATTERY=$(echo "$(cat /sys/class/power_supply/BAT0/capacity)%")
}

temp() {
	TEMP=$(echo "$(sed s/000//g /sys/class/hwmon/hwmon3/temp1_input)C")
}

clock
day
battery
temp

echo "${TIME} | ${DAY} | ${BATTERY} | ${TEMP}"
