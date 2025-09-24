#!bin/bash

USERID=$(id -u) #user ID

if [$USERID -ne 0]; then        
    echo "Error: please run the script"
fi


dnf install mysql -y        

if [ $? -ne 0 ]; then
    echo "Error: install mysql is failure"
else        
    echo "installing mysql is success"

fi