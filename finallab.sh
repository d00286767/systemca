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
 


  3)echo "----- File Management -----"
   echo "1. Create File"
   echo "2. Create Directory"
   echo "3. Backup Directory"
   echo "4. Back to Main Menu"
   read -p "Choose option: " choice

   case $choice in
    1)
       read -p "Enter file name: " file
       if [ -e "$file" ];
       then
          echo "File already exists!"
       else
            touch "$file"
            echo "File created."
        fi;;

     2)
        read -p "Enter directory name: " dir
        if [ -d "$dir" ]; then
               echo "Directory already exists!"
         else
              mkdir "$dir"
              echo "Directory created."
         fi ;;

      3)  read -p "Enter source directory: " src
           read -p "Enter backup location: " dest

           if [ ! -d "$src" ]; then
                echo "Source directory does not exist!"
           else
                 mkdir -p "$dest"
                 cp -r "$src" "$dest"
                 echo "Backup completed."
           fi;;

       4)break;;

       *)
                echo "Invalid option!"
                ;;
        esac

        echo
   

 4)
 #!/bin/bash

while true; do
    echo "1. Add User"
    echo "2. Delete User"
    echo "3. Check User"
    echo "4. List Users"
    echo "5. Exit"
    read -p "Choice: " ch

    case $ch in
        1)
            read -p "Username: " u
            grep -q "^$u:" /etc/passwd && echo "Exists!" || sudo useradd "$u"
            ;;

        2)
            read -p "Username: " u
            grep -q "^$u:" /etc/passwd && sudo userdel "$u" || echo "Not found!"
            ;;

        3)
            read -p "Username: " u
            grep "^$u:" /etc/passwd | awk -F: '{print $1, $3, $6}' | sed 's/^/User: /' || echo "Not found!"
            ;;

        4)
            awk -F: '{print $1}' /etc/passwd | sed 's/^/- /'
            ;;

        5)
            break
            ;;
    esac
done
 5)break;;
 *) echo "incorrect option";;
 esac
done 
 
