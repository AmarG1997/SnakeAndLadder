#!/bin/bash -x

echo "Welcome to Snake & Ladder "

#Constant
WINNING_POSITION=100

#variable
position=0
player1Position=0
player2Position=0
dice=0

function getPosition()
{
	position=$1
	diceValue=$(($RANDOM%6 +1 ))
	option=$(($RANDOM%3))

	case $option in
		0)
			position=$position
		;;
		1)
			position=$(($position + $diceValue))
		;;
		2)
			position=$(($position - $diceValue))
		;;

	esac

	if [ $position -lt 0 ]
	then
		position=0
	fi

	if [ $position -gt $WINNING_POSITION ]
	then
		position=$(($position-$diceValue))
	fi

	echo $position
}

function getWinner()
{
	while [[ $player1Position -lt $WINNING_POSITION && $player2Position -lt $WINNING_POSITION ]]
	do
		dice=$(($dice+1))
		player1Position=$(getPosition $player1Position )
		echo "Player1 Position : "$player1Position
		player2Position=$(getPosition $player2Position )
		echo "Player2 Position : "$player2Position
	done

	if [ $player2Position -eq $WINNING_POSITION ]
	then
		echo "$player2 win"
	else
		echo "$player1 win"
	fi

}
function main()
{
	read -p "Enter 1st Player Name : " player1
	read -p "Enter 2nd Player Name : " player2
	getWinner
	echo "Total Dice Rolled : "$dice
}
main
