#!/bin/bash
#Purpose = Backup of photos in Filmoteka
#START
DATE=`date +%b-%d-%y`
TIME=`date +%T`
FILENAME=backup-filmoteka-$DATE-$TIME.tar.gz
SRCDIR=root/apache-tomcat-7.0.81/webapps/filmoteka                   # Location of Important Data Directory (Source of backup).
DESDIR=home/pi/Desktop/Backup            # Destination of backup file.
tar -zcvf $DESDIR/$FILENAME $SRCDIR
#END