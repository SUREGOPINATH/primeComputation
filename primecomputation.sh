#!/bin/bash

echo "welcome to prime computation"

function intialise() {
        count=0
        index=0
        prime=2
        declare -a primeArray

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

function printArray() {

        echo "first 100 prime number are : "
   for (( counter=$(($index-1)); counter>=0; counter-- ))
   do
      echo ${primeArray[$counter]}
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
        	        prime=$(($prime+1))
			count=$(($count+1))
		else
			prime=$(($prime+1))
		fi
        done
        printArray
}

function primeComputation() {

        intialise;
	firstHundredPrime;

        ##firstFiftyAlterPrime;
##      firstHundredWithUnitPlace;
}

primeComputation;
