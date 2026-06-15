check_service() {
    if [ $1 = "Running" ]; then
        return 0
    else 
        return 1    
    fi
}

check_service "Running"
echo "Exit status of check_service function: $?"

check_service "Stopped"
echo "Exit status of check_service function: $?"
