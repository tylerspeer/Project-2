#!/usr/bin/bash

greeting="Welcome"
user=$(whoami)
day=$(date +%A)

echo "$greeting back $user! Today is $day, which is best day of the entire week!"
echo "Your Bash shell version is : $BASH_VERSION. Enjoy!"

