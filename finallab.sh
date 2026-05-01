#!/bin/bash

basic_system_info() {
  echo "---------Basic system information-------------"
  echo "Hostname: $(hostname)"
  echo "Username: $(whoami)"
  echo "Kernel version: $(uname -r)"
  echo "User currently logged in: $(who)"
  echo "Date and Time: $(date)"
}

disk_management_menu() {
  echo "-----------Disk Management--------------------"
  echo "Disk space:"
  df / | grep / | awk '{print "Used:", $3, "Available:", $4, "Use%:", $5}' | sed 's/%//'
  echo "Memory usage: "
  free -h | grep Mem | awk '{print "Used:", $3, "Available:", $7}'
  echo "Top processes:"
  ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6    
}

user_management_menu() {
  while true;
  do
    echo "---------- User Management ---------------"
    echo "1. Add User"
    echo "2. Delete User"
    echo "3. Check User"
    echo "4. List Users"
    echo "5. Back to Main Menu"
    read -p "Choice: " ch

    case $ch in
      1)
        read -p "Username: " u
        if grep -q "^${u}:" /etc/passwd; then
          echo "Exists!"
        else
          sudo useradd "$u" && echo "User added."
        fi
        ;;

      2)
        read -p "Username: " u
        if grep -q "^${u}:" /etc/passwd; then
          sudo userdel "$u" && echo "User deleted."
        else
          echo "Not found!"
        fi
        ;;

      3)
        read -p "Username: " u
        if grep -q "^${u}:" /etc/passwd; then
          grep "^${u}:" /etc/passwd | awk -F: '{print "User:", $1, "UID:", $3, "Home:", $6}'
        else
          echo "Not found!"
        fi
        ;;

      4)
        awk -F: '{print "- " $1}' /etc/passwd
        ;;

      5)
        break
        ;;

      *)
        echo "Invalid option!"
        ;;
    esac
    echo
  done
}

file_management_menu() {
  while true
  do
    echo "--------------- File Management ----------------"
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
        fi
        ;;

      2)
        read -p "Enter directory name: " dir
        if [ -d "$dir" ]; then
          echo "Directory already exists!"
        else
          mkdir "$dir"
          echo "Directory created."
        fi
        ;;

      3)
        read -p "Enter source directory: " src
        read -p "Enter backup location: " dest

        if [ ! -d "$src" ]; then
          echo "Source directory does not exist!"
        else
          mkdir -p "$dest"
          cp -r "$src" "$dest"
          echo "Backup completed."
        fi
        ;;

      4)
        break
        ;;

      *)
        echo "Invalid option!"
        ;;
    esac
    echo
  done
}

#using while loop to run the first menu
while true
do
 #Giving the option
 echo "--------------------Menu-----------------------"
 echo "1.Basic system information"
 echo "2.Disk Management"
 echo "3.File Management"
 echo "4.User Management"
 echo "5.Exit"
 #asking the options
 read -p "Enter the option:" option

 case $option in
 1)
    basic_system_info
    ;;

 2)
    disk_management_menu
    ;;

 3)
    file_management_menu
    ;;

 4)
    user_management_menu
    ;;

 5)
    break
    ;;

  *)
    echo "incorrect option"
    ;;
 esac
done 
 
