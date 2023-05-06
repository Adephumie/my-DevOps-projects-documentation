#!/usr/bin/bash 

#########################################
# Shell Script for deleting Linux users.#
#########################################

# Variables
users_list="$(cat ~/users-script/names.csv)"

# Check if user has sudo privieges
if [ $(id -u) -eq 0 ]; then
    echo "$users_list"

	for user in $users_list;
    do 
        echo "$user"
        # check if user exists on the server
	    egrep "^$user" /etc/passwd >/dev/null
	    if [ $? -eq 0 ]; then
        echo "Deleting user $user from the system ............."
		deluser --remove-home $user >/dev/null
		echo "User $user deleted"
		
		exit 1
	    else
        echo "$users file not found" >&2
	    exit 1 #to exit with the error (or 1) condition

		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
		useradd -m -p "$pass" "$username"
		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
	    fi
else
    # If user is not a root user
	echo "Only root may delete a user from the system."
	exit 2
fi