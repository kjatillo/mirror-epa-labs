#!/bin/bash

# this is a comment

# for loop to count to 10
for c in {1..5}; do
	echo "Count: $c"

	# if does not use == it uses -eq
	# note the spaces around if [ ]
	if [ $c -eq 3 ]; then
		echo "found the third item"
	fi
done

# how do we pass parameters from the command line
# into this bash script. 
# we use the notation $1, $2 etc to represent
# the first, second etc parameter into this script
if [ -z $1 ]; then
	echo "You didn't pass any paraemters to $0"
	exit 1
else
	echo "You passed in $1 to $0"
fi

# Check if user has passed a second param
if [ -z $2 ]; then
	echo "Specify a second parameter 'echo' to print to screen or 'log' to save to file"
	exit 1
else
	echo "You passed $2 as second parameter"
fi

# heres a brand new command: 
# it calls ps -ef, then pipes it into word counter
# then stores the result in ct
ct=$(ps -ef | wc -l)
echo "There are $ct processes running on this machine"

timestamp=$(TZ="Europe/Dublin" date +"%Y-%m-%d %H:%M:%S")
if [ $2 = "log" ]; then
	if [ $ct -gt $1 ]; then
		echo "Maximum number of processes exceeded $timestamp" >> log.txt
	else
		echo "Maximum number of processes NOT exceeded $timestamp" >> log.txt
	fi
elif [ $2 = "echo" ]; then
	if [ $ct -gt $1 ]; then
		echo "Maximum number of processes exceeded $timestamp"
	else
		echo "Maximum number of processes NOT exceeded $timestamp"
	fi
fi
