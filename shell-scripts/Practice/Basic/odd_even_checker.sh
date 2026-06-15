#Arithmetic evaluation (( )) → use ==
#Here, ==, !=, >, <, >=, <= are used naturally.
#2. Test command [ ] → use -eq

read -p "Enter a number:" num

if (( num % 2 == 0 )); then
    echo "The number is even."
else
    echo "The number is odd."
fi
