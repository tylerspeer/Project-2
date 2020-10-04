#!/usr/bin/bash

tar -czf /tmp/myhome_directory.tar.gz /c/users/huynh304/Project-2/
#This bash script is used to backup a user's home directory to /tmp/.

user=$(whoami)
input=/home/$user
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

tar -czf $output $input
echo "Backup of $input completed! Details about the output backup file:"
ls -1 $output
