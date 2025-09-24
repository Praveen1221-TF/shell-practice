#!bin/bash

USERID=$(id -u) #user ID

if [ $USERID -ne 0 ]; then        
    echo "Error: please run the script with root user"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "Error: install $2 is failure"
         exit 1
    else        
        echo "installing $2 is success"

    fi

}


dnf install mysql -y         
VALIDATE $? "MYSQL"

dnf install nginx -y         
VALIDATE $? "Nginx"

dnf install python3 -y      
VALIDATE $? "python3"