# User input - path to folder or directory
userInput=$1

# Count the number of files in the directory
countFiles=$(ls $1 | wc -l)

# Function to display output for re-use
output() {
	echo "Number of files in $userInput: $countFiles"
}

if [ -z $1 ]; then
	# Display output to screen by default if no argument is passed
        output
elif [ $2 = "log" ]; then
	# Log the ouput if a second argument log is passed
	output >> exB_log.txt
fi
