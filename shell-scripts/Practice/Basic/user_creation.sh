# Users stores in /etc/passwd file. We can check if a user exists by using the id command. If the user does not exist, 
#we can create it using the useradd command and delete it using the userdel command.

read -p "Enter username:" user

if id "$user" &>/dev/null; then
    echo "$user already exists."
else 
    sudo useradd "$user"
    echo "User $user created successfully."
fi    
    