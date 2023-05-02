# <b>Steps Taken For The Project's Implementation</b>

## <b>Create the shell script with names:</b>

Create a shell script that reads a csv file containing the first name of the users to be onboarded.

1. Create the project folder called `users-script`:
   
   ```
   mkdir users-script
   ```

2. Move into the `users-script` directory:
   
   ```
   cd users-script
   ```

3. Create a csv file name `names.csv`:
   
   ```
   touch names.csv
   ```

4. Open the `names.csv` file and insert some random names into it. (One name per line):
   
   ```
   vim names.csv
   ```

5. On the VM, create a group called `developers` manually with command:
   
   ```
   sudo groupadd developers
   ```

6. Generate an `ssh key` for the current user (that you logged into the system with) with this command:
   
   ```
   ssh-keygen -t rsa
   ```

And follow the prompts to generate the key pairs. 

7. Create a file and call it `create-users.sh`:
   
   ```
   touch create-users.sh
   ```

8. Open the file and add the following code lines:
   
   ```
    #!/usr/bin/bash

    #Check for the existence  of the user on the system
   
    if id "$1" &>/dev/null; then
        echo 'user found'
    else
        echo 'user not found'
    fi
    ```



