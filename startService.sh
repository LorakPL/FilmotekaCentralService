#!/bin/bash
SERVICE_WAR=filmoteka.war
TOMCAT7_HOME=/home/pi/apache-tomcat-7.0.81
MYSQL_ROOT_PASS=root

#Check Java
echo 'Check Java...' >&2
if ! [ -x "$(command -v java)" ]; then
  echo 'Install Java.' >&2
  sudo apt-get install -y oracle-java8-jdk
fi
echo 'Java OK.' >&2

#Check Tomcat7
echo 'Check Tomcat7...' >&2
if [[ ! -e $TOMCAT7_HOME ]]; then
  echo 'Install Tomcat7.' >&2
  wget http://ftp.ps.pl/pub/apache/tomcat/tomcat-7/v7.0.81/bin/apache-tomcat-7.0.81.tar.gz
  tar xzf apache-tomcat-7.0.81.tar.gz -C ~/
  rm -f apache-tomcat-7.0.81.tar.gz
fi
echo 'Tomcat7 OK.' >&2

#Check mysql
echo 'Check mysql...' >&2
if ! [ -x "$(command -v mysql)" ]; then
  echo 'Install mysql.' >&2
  echo "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASS" | sudo debconf-set-selections
  echo "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASS" | sudo debconf-set-selections
  sudo apt-get install -y mysql-server
fi
echo 'mysql OK.' >&2

if ! [ -x "$(ps aux | grep tomcat)" ]; then
  echo "Stop tomcat" >&2
  bash $TOMCAT7_HOME/bin/catalina.sh stop
fi

echo "Set up data..." >&2

echo "Create database." >&2
sudo mysql -u root -p$MYSQL_ROOT_PASS < database.sql

echo "Setting up the site" >&2
cp $SERVICE_WAR $TOMCAT7_HOME/webapps/$SERVICE_WAR

echo "Start tomcat" >&2
bash $TOMCAT7_HOME/bin/catalina.sh start