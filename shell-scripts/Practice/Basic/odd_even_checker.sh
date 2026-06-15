read -p "Enter a number:" num

if (( num%=0 )); then
    echo "The number is even."
else
    echo "The number is odd."
fi