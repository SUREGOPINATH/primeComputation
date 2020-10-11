#!/bin/bash

echo "welcome to prime computation"

function intialise() {
        count=0
        index=0
        prime=2
        declare -a primeArray
	declare -a primePallindromeArray
	declare -a primeArray2
}

function checkPrime() {

        flag=0
        upper=$(( $1/2 ))
        for (( counter=2;counter<=$upper;counter++ ))
        do
                if [ $(($1%$counter)) -eq 0 ]
                then
                        flag=1
                        break
                fi
        done
        echo $flag
}

function pallindromeChecker() {

        temp=$1
        while (( $temp!=0 ))
        do
                remainder=$(($temp%10))
                reversedNumber=$((reversedNumber*10 +remainder))
                temp=$(($temp/10))
        done
	if [ $1 -eq $reversedNumber ]
	then
	        echo 0
	else
        	echo 1
	fi


}

function printArray() {

        echo "first 100 prime number are : "
   for (( counter=$(($index-1)); counter>=0; counter-- ))
   do
      echo ${primeArray[$counter]}
   done

}

function printAlterArray() {

        echo "first 50 alter prime number are : "
        for (( counter=$(($index-1)); counter>=0; counter-- ))
        do
                echo ${primeArray2[$counter]}
                counter=$(($counter-1))
        done
}

function firstHundredPrime() {

        while [ $count -lt 100 ]
        do
                primeNumber=$( checkPrime $prime )
		if [ $primeNumber -eq 0 ]
		then
	                primeArray[$index]=$prime
			index=$(($index+1))
			count=$(($count+1))
		fi
		prime=$(($prime+1))
        done
        printArray
}

function firstFiftyAlterPrime() {

        while [ $count -lt 50 ]
        do
                primeNumber=$( checkPrime $prime )
                if [ $primeNumber -eq 0 ]
                then
                        primeArray2[$index]=$prime
                        index=$(($index+1))
			count=$(($count+1))
                fi
		prime=$(($prime+1))
        done
        echo ${primeArray2[@]}
        printAlterArray;

}

function firstHundredWithUnitPlace() {


        echo "first hundred prime numbers with 1 in unit place"

	for (( counter=0; counter<${#primeArray[@]} ;counter++ ))
        do
                        if [ $((${primeArray[$counter]}%10)) -eq 1 ]
                        then
                                echo ${primeArray[$counter]}
                        fi
	done
}

function pallindromePrime() {

	while [ $prime -lt 200 ]
        do
                primeNumber=$( checkPrime $prime )
                if [ $primeNumber -eq 0 ]
                then
			if [ $(pallindromeChecker $prime) -eq 0 ]
			then
	                        primePallindromeArray[$index]=$prime
        	                index=$(($index+1))
			fi
                fi
                prime=$(($prime+1))
        done
	echo ${primePallindromeArray[@]}

}
function primeComputation() {

        intialise;
	firstHundredPrime;
	intialise;
        firstFiftyAlterPrime;
	intialise;
        firstHundredWithUnitPlace;
	intialise;
	pallindromePrime;
}

primeComputation;
