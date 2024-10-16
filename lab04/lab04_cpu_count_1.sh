#!/bin/bash

# Check if an argument has been passed by the user
if [ -z $1 ]; then
	echo "Usage: $0 [MAX_NUM_CORES]"
	exit 1
fi


# Get required CPU cores
requiredCores=$1

# Get number of CPU cores
cpuCores=$(nproc)

# Compare
if [ $cpuCores -lt $requiredCores ]; then
	echo "The number of CPU cores ($cpuCores) does not meet the requirements of ($requiredCores) cores"
else
	echo "The number of CPU cores ($cpuCores)  has met the requirements of ($requiredCores) cores"
fi
