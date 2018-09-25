#!/bin/sh

STATUS=$(xsetwacom --get "Wacom Bamboo 16FG 4x5 Finger touch" touch)
echo $STATUS

if [[ "$STATUS" == "off" ]]
then
	xsetwacom --set "Wacom Bamboo 16FG 4x5 Finger touch" touch on
	echo "on"
else
	xsetwacom --set "Wacom Bamboo 16FG 4x5 Finger touch" touch off
	echo "off"
fi
