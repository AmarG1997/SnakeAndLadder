#!/bin/bash -x

echo "Welcome to Snake & Ladder "

position=0
endPosition=100
diceCount=0
dice=0

declare -A positionDictionary


while [ $position -lt $endPosition ]
do
	diceRandom=$(($RANDOM%6 +1 ))
	((diceCount++))
	option=$(($RANDOM%3))

	case $option in
		0)
			position=$position
		;;
		1)
			position=$(($position + $diceRandom))
		;;
		2)
			position=$(($position - $diceRandom))
		;;
	esac

				if [ $position -lt 0 ]
				then
					position=0
				elif [ $position -gt $endPosition ]
				then
					position=$(($postition-$diceRandom))
				fi
	positionDictionary[$dice]="$position"
	dice=$(( $dice + 1 ))
done


for i in ${!positionDictionary[@]}
do
	echo "Dice $i : ${positionDictionary[$i]}"
done | sort -k2 -n

echo "Number of time dice rolled : "$diceCount
