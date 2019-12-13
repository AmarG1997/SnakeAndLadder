#!/bin/bash -x

echo "Welcome to Snake & Ladder "

position=0
endPosition=100
diceCount=0
dice=0

function getPosition()
{
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
	fi
	if [ $position -gt $endPosition ]
	then
		position=$(($postition-$diceRandom))
	fi

	positionDictionary[$dice]="$position"
	dice=$(( $dice + 1 ))
	echo "Position : " $position

done

}
getPosition
echo "Number of time dice rolled : "$diceCount


