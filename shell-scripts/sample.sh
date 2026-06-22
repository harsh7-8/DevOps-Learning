#!/bin/bash

x=25

if [ $x -le 20 ];then
    echo "$x is smaller than 20"
elif [ $x -gt 25 ]; then
    echo "$x is greater than 25"
else
    echo "$x is betweeen 20 and 26"
fi    