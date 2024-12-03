add_user() {
  echo "Enter the username to add:"
  read username
  sudo useradd "$username"
  if [ $? -eq 0 ]; then
    echo "User $username added successfully."
    echo "Set a password for $username:"
    sudo passwd "$username"
    if [ $? -eq 0 ]; then
      echo "Password set successfully for $username."
    else
      echo "Failed to set password for $username."
    fi
  else
    echo "Failed to add user $username."
  fi
}

list_users() {
  echo "Current users in the system:"
  cut -d: -f1 /etc/passwd
}

delete_user() {
  echo "Enter the username to delete:"
  read username
  
  # Check if the user exists
  if id "$username" &>/dev/null; then
    # Terminate all processes owned by the user
    echo "Terminating all processes for user $username..."
    sudo pkill -u "$username"
    
    # Delete the user
    sudo userdel "$username"
    if [ $? -eq 0 ]; then
      echo "User $username deleted successfully."
    else
      echo "Failed to delete user $username."
    fi
  else
    echo "User $username does not exist."
  fi
}

while true; do
  echo -e "\nChoose an option:"
  echo "1. Add a user with a password"
  echo "2. Delete a user"
  echo "3. Show all users"
  echo "4. Exit"
  read choice

  case $choice in
    1)
      add_user
      echo "Displaying all users:"
      list_users
      ;;
    2)
      delete_user
      ;;
    3)
      list_users
      ;;
    4)
      echo "Exiting the script. Goodbye!"
      break
      ;;
    *)
      echo "Invalid option. Please choose 1, 2, 3, or 4."
      ;;
  esac
done
