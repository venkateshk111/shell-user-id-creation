#!/bin/bash
# edit below line with username to add that user to server example below is for user svc-ansible
username=svc-ansible
egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
  printf "\n\n$username already exists! No Action Taken!!\n"
else
  sudo useradd -m $username
  [ $? -eq 0 ] && printf "\nUser $username has been added to system!\n" || printf "\nFailed to add a user!\n"
fi