#!/bin/bash         

NUM=$1

if [ $NUM -lt 20 ]; then
    echo "given number $NUM is less than 10"
elif [ $NUM -eq 20 ];
    echo "given number $NUM is equal to $NUM"   
else
    echo "given number $NUM is greater than 10"              
fi    

