#!/usr/bin/env bash
while true; do
	pactl set-source-volume @DEFAULT_SOURCE@ 32%
done
