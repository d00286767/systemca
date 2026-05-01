#!bin/bash

#using while loop to run the first menu
while true
do
 #Giving the option
 echo "----------Menu-------------"
 echo "1.Basic system information"
 echo "2.Disk Management"
 echo "3.File Management"
 echo "4.User Management"
 echo "5.Exit"
 #asking the options
 read -p "Enter the option:" option

 case $option in
 #If the user enter 1
 1)echo "---------Basic system information-------------"
   echo "Hostname: $(hostname)"
   echo "Username: $(whoami)"
   echo "Kernal version: $(uname -r)"
   echo "User currently logged in: $(who)"
   echo "Date and Time: $(date)";;

 2)echo "-----------Disk Management--------------------"
   #create variable each command
   disk = $(df -h | grep -v tmpfs)
   mem =  $(free -h | grep Mem)
   pro = $(ps)
   echo "Disk usage: $(disk)%"
   echo "Memory usage: $(mem)%"
   echo "Top process: $(pro)%";;
   
 3)echo "";;
 4)echo "";;
 5)break;;
 *) echo "incorrect option";;
 esac
done 
 
