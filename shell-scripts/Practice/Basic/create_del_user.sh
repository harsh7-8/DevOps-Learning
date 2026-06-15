# no login user: this user exists but cannot log in to the system. It is used for running services or 
#daemons that do not require user interaction. The shell for this user is set to /usr/sbin/nologin, which prevents login access.
echo "User Management Script:"
echo "1. Create user"
echo "2. Create no login user"
echo "3. Delete user"

read -p "Enter your choice (1/2/3):" choice

case $choice in
    1)
        read -p "Enter username to create:" username
        wait 2
        sudo useradd $username
        wait 1
        echo "User $username created successfully."
        ;;
    2)
        read -p "Enter username to create (no login):" username
        wait 2
        sudo useradd -s /usr/sbin/nologin $username
        wait 1
        echo "No login user $username created successfully."
        ;;
    3)
        read -p "Enter username to delete:" username
        wait 2
        if id "$username" &>/dev/null; then
            echo "User $username exists. Deleting..."
            wait 2
        else 
            echo "User $username does not exist."
            wait 1
            exit 1
        fi
        wait 1
        sudo userdel $username
        wait 1
        echo "User $username deleted successfully."
        ;;
    *)
        wait 1
        echo "Invalid choice. Please select 1, 2, or 3."
        ;;
esac