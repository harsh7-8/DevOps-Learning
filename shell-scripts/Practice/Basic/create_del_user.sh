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
        sudo useradd $username
        echo "User $username created successfully."
        ;;
    2)
        read -p "Enter username to create (no login):" username
        sudo useradd -s /usr/sbin/nologin $username
        echo "No login user $username created successfully."
        ;;
    3)
        read -p "Enter username to delete:" username
        if id "$username" &>/dev/null; then
            echo "User $username exists. Deleting..."
        else 
            echo "User $username does not exist."
            exit 1
        fi
        sudo userdel $username
        echo "User $username deleted successfully."
        ;;
    *)
        echo "Invalid choice. Please select 1, 2, or 3."
        ;;
esac