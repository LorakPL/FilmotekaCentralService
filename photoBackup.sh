#!/bin/bash

#Purpose = Backup of photos in Filmoteka

#START

DATEANDTIME=`date +%Y-%m-%d_%H-%M-%S`
FILENAME=backup-filmoteka-$DATEANDTIME.zip
SRCDIR=/root/apache-tomcat-7.0.81/webapps/filmoteka/images     	# Location of Important Data Directory (Source of backup).
DESDIR=/home/pi/Documents/Filmoteka/Backup              	# Destination of backup file.
zip -r $DESDIR/$FILENAME $SRCDIR

#END
