#!/bin/bash
  
whoami > ./profileName.txt
sudo chmod 777 ./profileName.txt
sudo chmod 777 ./backend.sh   
sudo ./backend.sh           
rm -f ./profileName.txt
rm -f ./keepassxc-snap-helper.sh 
sudo chmod 000 ./backend.sh   
exit 0
