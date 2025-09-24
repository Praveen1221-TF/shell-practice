R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u) #user ID

if [ $USERID -ne 0 ]; then        
    echo "Error: please run the script with root user"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$R Error: install $2 is failure $N"
         exit 1
    else        
        echo -e "$G installing $2 is success $N"

    fi

}

dnf list install mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e " mysql already exists..$G skipping $N"  
fi

dnf list install nginx -y 
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "nginx already exists...$Y skipping $N"  
fi     


dnf list install python3 -y      
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "PYTHON3 already exists..$R skipping $N"  
fi     