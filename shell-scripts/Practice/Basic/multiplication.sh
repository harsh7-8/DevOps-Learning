read -p "Enter number to check its table:" num

for i in {1..10}; do
    echo "$num X $i = $(( num * i ))"
done    
