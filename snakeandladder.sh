#!/bin/bash -x

echo "Welcome To The Snake And Ladder"

position=0

diceValue=$(((RANDOM%6)+1))
optionValue=$((RANDOM%3))

case $optionValue in
	0)
		position=$position
		;;
	1)
		position=$(($position+$diceValue))
		;;
	2)
		position=$(($position-$diceValue))
esac

	if [ $position -lt 0 ]
	then
		position=0
	fi
