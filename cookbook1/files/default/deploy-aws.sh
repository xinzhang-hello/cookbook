#!/bin/bash
echo "Update package"
sudo apt-get update -y

echo "Install unzip package"
sudo apt-get install zip -y
sudo apt-get install unzip -y

echo "Init python env"
sudo apt-get install python-pip -y
sudo pip install Flask

echo "Remove install, app and bash_profile"
rm -rf install*
rm -rf /app
rm -rf ~/.bash_profile

echo "Get install.zip from AWS S3"
wget https://s3-eu-west-1.amazonaws.com/elasticbeanstalk-eu-west-1-533593536721/install.zip

echo "Unzip install.zip"
unzip install.zip

echo "Create /app"
mkdir /app

echo "Unzip jdk"
tar -zxvf install/server-jre-8u181-linux-x64.tar.gz

echo "Moving jdk to /app"
mv jdk1.8.0_271 /app

echo "Install bash_profile"
mv install/bash_profile ~/.bash_profile

echo "Set new env for java"
source ~/.bash_profile

echo "Moving startup file"
mv install/startup.sh /home/ubuntu

echo "Moving update bot script"
mv install/stopAndUpdate.sh /home/ubuntu/

echo "Moving redeploy python script"
mv install/redeploy.py /home/ubuntu/

echo "Start redeploy python script"
sudo nohup python /home/ubuntu/redeploy.py >> /home/ubuntu/redeploy.out &

echo "Waiting 5s"
sleep 5

echo "Send redeploy command"
curl "http://127.0.0.1:7777/redeploy"

echo "Remove temp file"
rm -rf install*

exit 0;
