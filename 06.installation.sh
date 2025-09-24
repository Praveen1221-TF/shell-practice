#!bin/bash

USERID=$(id -u) #user ID

if [$USERID -ne 0]; then        
    echo "Error: please run the script with root user"
    exit 1
fi



dnf install mysql -y         

if [ $? -ne 0 ]; then
    echo "Error: install mysql is failure"
    exit 1
else        
    echo "installing mysql is success"

fi

dnf install nginx -y         

if [ $? -ne 0 ]; then
    echo "Error: install nginx is failure"
    exit 1
else        
    echo "installing nginx is success"

fi

dnf install mongodb-mongosh -y      

if [ $? -ne 0 ]; then
    echo "Error: install mysmongodb-mongosh is failure"
    exit 1
else        
    echo "installing mmongodb-mongosh is success"

fi