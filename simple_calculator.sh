#!/usr/bin/env bash
#echo "Enter an arithmetic operation:"
#regex expression
re='^[-0-9 ]+ [-,+,*,/] [-0-9]+$'
re_float='^[-+]?[0-9]+\.?[0-9]* [-,+,*,/,^] [-+]?[0-9]+\.?[0-9]*$'
#read operation

#check condition
function operation_condition() {
	operation_result=$(echo "scale=2; $operation" | bc -l)
	re_float='^[-+]?[0-9]+\.?[0-9]* [-,+,*,/,^] [-+]?[0-9]+\.?[0-9]*$'
	if [[ "$operation" =~ $re_float ]]; then
		printf "%s\n" "$operation_result"
	else
 		echo "Operation check failed!"
	fi
}


function operation_loop() {
	echo "Enter an arithmetic operation or type 'quit' to quit:"
	read operation
	until [[ "$operation" =~ 'quit' ]]; do
		operation_condition
		operation_loop
	done	
}


function main() {
	echo "Welcome to the basic calculator!"
	operation_loop
	echo "Goodbye!"
	exit
}

main

