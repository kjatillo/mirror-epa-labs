#!/bin/bash

# Function with message for no param passed
usage() {
	echo "Usage: $0 [MAX_NUM_CORES]"
	exit 1
}

# Check if an argument has been passed by the user
if [ -z $1 ]; then
	usage
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

# Selected commands
echo "--- Selected Commands ---"
echo "[1] uname: This command is used to display system information useful for logging purpose such as after a success message"
echo "[2] date: This command is used to display the current date and time useful for loggin as well such as adding a timestamp to the success message"

# Print the current date and time
echo "Script executed on: $(date)"

# Print sytem information
echo "System information: $(uname -a)"

