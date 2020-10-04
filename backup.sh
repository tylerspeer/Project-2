#!/usr/bin/bash

tar -czf /tmp/myhome_directory.tar.gz /c/users/huynh304/Project-2/
#This bash script is used to backup a user's home directory to /tmp/.
if [ -z $1]; then
	user=$(whoami)
else
	if [ ! -d "/home/$1" ]; then
		echo "Requested $1 user home directory doesn't exist."
		exit 1
	fi
	user=$1
fi

input=/home/$user
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz
#The function total_files report a total number of files for a given directory.
function total_files {
	find $1 | wc -l
}

#The function total_directories report a total number of directories for a given directory.
function total_directories {
	find $1 -type d | wc -l
}
function total_archived_directories {
	tar -tzf $1 | grep  /$ | wc -l
}
function total_archived_files {
	tar -tzf $1 | grep -v /$ | wc -l
}

tar -czf $output $input 2> /dev/null

src_files=$( total_files $input )
src_directories=$( total_directories $input )

arch_files=$( total_archived_files $output )
arch_directories=$( total_archived_directories $output )

echo "########## $user ##########"
echo "Files to be included: $src_files" 
echo "Directories to be included : $src_directories" 
echo "Files archived: $arch_files"
echo "Directories archived: $arch_directories"

if [ $src_files -eq $arch_files ]; then
        
	echo "Backup of $input completed! Details about the output backup file:"
	ls -1 $output
else 
	echo "Backup of $input failed!"
fi
