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
	diceRandom=$(($RANDOM%6 +1 ))
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

	if [ $position -gt $WINNING_POSITION ]
	then
		position=$(($position-$diceRandom))
	fi

	echo $position
}

flag=1

function getWinner()
{
while [[ $player1Position -lt $WINNING_POSITION && $player2Position -lt $WINNING_POSITION ]]
do
	dice=$(( $dice + 1 ))
	if [ $flag -eq 1 ]
	then
		player1Position=$(getPosition $player1Position)
		echo "player1 position : "$player1Position
		flag=0
				if [ $player1Position -eq $WINNING_POSITION ]
				then
					echo "$player1 win !!!"
					exit
				fi
	fi

	if [ $flag -eq 0 ]
	then
			player2Position=$(getPosition $player2Position)
			echo "player2 position : "$player2Position
			flag=1
				if [ $player2Position -eq $WINNING_POSITION ]
					then
							echo "$player2 win !!!!"
					break;
				fi
	fi
done
}

function main()
{
echo "Total Dice Rolled : "$dice
read -p "Enter 1st Player Name : " player1
read -p "Enter 2nd Player Name : " player2
getWinner
}
main
