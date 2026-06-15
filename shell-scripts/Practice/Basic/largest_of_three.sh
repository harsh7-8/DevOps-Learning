read -p "Enter number a:" a
read -p "Enter number b:" b
read -p "Enter number c:" c

if [ $a -gt $b ] && [ $a -gt $c ]; then
    echo "The largest number is: $a"
elif [ $b -gt $c ]; then
    echo "The largest number is: $b"
else
    echo "The largest number is: $c"
fi    
echo "Script execution completed: $?"
    