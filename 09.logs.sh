#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(basename "$0" .sh)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" 

mkdir -p $LOGS_FOLDER
echo "script started excuted at : $(date)"

if [ $USERID -ne 0 ]; then        
    echo "Error: please run the script with root user"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$R Error: install $2 is failure $N" | tee -a $LOG_FILE
         exit 1
    else        
        echo -e "$G installing $2 is success $N" | tee -a $LOG_FILE

    fi

}

dnf list install mysql -y &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
else
    echo -e " mysql already exists..$G skipping $N"  | tee -a $LOG_FILE
fi

dnf list install nginx -y &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "nginx already exists...$Y skipping $N"  | tee -a $LOG_FILE
fi     


dnf list install python3 -y &>>$LOG_FILE   
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "PYTHON3 already exists..$R skipping $N"  | tee -a $LOG_FILE
fi     

