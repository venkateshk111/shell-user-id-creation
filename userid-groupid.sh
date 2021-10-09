#!/bin/bash
#  File name: userid-groupid.sh                                                                         
#  Owner: Venkatesh K
#  Description: This script will create user id with sudo permission and group id , add user to group                                                                                
#  Edit below 2 lines with actual username and group name
username=ansible
groupname=Dev
egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
  printf "\n\n$username already exists! No Action Taken!!\n"
else
  sudo useradd -m $username
  [ $? -eq 0 ] && printf "\nUser $username has been added to system!\n" || printf "\nFailed to add a user!\n"
fi
egrep "^$groupname" /etc/group >/dev/null
if [ $? -eq 0 ]; then
  printf "\n\n$groupname already exists! No Action Taken!!\n"
else
  sudo groupadd $groupname
  sudo usermod -a -G $groupname $username
  [ $? -eq 0 ] && printf "\nUser $username has been added to $groupname!\n" || printf "\nFailed to add a user!\n"
fi
# Providing sudo permission to given user
echo "$username ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$username
