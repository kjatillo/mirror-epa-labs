# Get the number of processes running
processList=$(ps -ef)

# Method to display the process list
logProcesses() {
	echo $processList >> log.txt
}

# Invoke the function 3x - ideally want to use for loop
logProcesses
logProcesses
logProcesses

logLineCount=$(cat log.txt | wc -l)
echo "Total number of lines in text file: $logLineCount"
