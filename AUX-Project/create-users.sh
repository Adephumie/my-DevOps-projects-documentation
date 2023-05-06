#!/usr/bin/bash 

#########################################
# Shell Script for creating Linux users.#
###################################################################
# This script will read a CSV file that contains 20 linux users.  #
# This script will then create each user on the server and add to #    
#  an existing group called 'Developers'.                         #
# The script will first check for the existence of the            #
# user on the system, before it will attempt to create it.        #
# The user that is being created must have a default home folder. #
# Each user should have a .ssh folder within its HOME folder. If  #
# it does not exist, then it will be created.                     #
# For each user’s SSH configuration, the script will create an    #
# authorized_keys file and add the public key of the current user.#
###################################################################

# Variables
users_list="$(cat ~/users-script/names.csv)"
PASSWORD=password
publickey="$(cat ~/.ssh/id_rsa.pub)"
group_name=$(developers)
ssh_folder="$(/home/$user/.ssh)"
ssh_auth_file="$(/home/$user/.ssh/authorized_keys)"

# Check if user has sudo privieges
if $(sudo -l &> /dev/null); then
    # Read the CSV file and loop through the names
    for user in users_list;
    do
        echo "about to create user $user"
        # Then check if user exists on the server
        if getent passwd "$user" > /dev/null 2>&1; then
            echo "this user already exists on the server"
            usermod -aG "$group_name" "$user" #user exists but add to developers group
            exit 1 #exit code with the error message (or 1)

        else
        # If user does not exist on the server
            echo "This is a new user, creating.........................."

            # Create the user with home directory and add to developers group
            sudo useradd -g "$group_name"\
                         -m -d "/home/$user"\
                         -s "/bin/bash" 
                         -p "$user"

        
            # Create .ssh folder for the user and set permission 
            sudo mkdir -m 700 "$ssh_folder"
            echo ".ssh directory created for $user"

            # Create authorized_keys file and set the permission
            sudo touch -m 600 "$ssh_auth_file"

            # Copy the public key into the authorized_keys file
            cp -R "$publickey" "$ssh_auth_file"
            echo "Public key copied to auth file"
            echo "=========================================="
            echo "=========================================="
            echo "user created"

            

        fi

else
    # If the user does not have sudo privileges  
    echo 'Error: root privileges are needed to run this script'
    exit 2
fi


echo "$publickey"

mkdir "$ssh_folder"
touch "$ssh_auth_file"