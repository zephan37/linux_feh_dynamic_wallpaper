#!/bin/bash
wallpaper_path=$1
cd $wallpaper_path
wallpaper_path=$PWD
file_count=$(ls -l | grep "^-" | wc -l)
step=$(echo "scale=3; 24 / $file_count" | bc)

while true
do
	now_time_h=$(date +%H)
	#now_time_h=$(echo "scale=0; $now_time_h - 1.5" | bc)
	#if [ $(echo "$now_time_h < 0" | bc) -eq 1 ]; then
	#	now_time_h=$(echo "scale=0; $now_time_h + 24" | bc)
	#fi

	now_time_m=$(date +%M)
	now_time=$(echo "scale=1; $now_time_h + $now_time_m / 60" | bc)
	now_should=$(echo "scale=0; $now_time / $step + 1" | bc)

	wallpaper_file=$wallpaper_path"/"$now_should".*"
	feh --bg-scale $wallpaper_file

	echo $wallpaper_file
	sleep 10m
done
