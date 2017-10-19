#!/bin/bash
#Purpose = Backup of photos in Filmoteka
#START
DATEANDTIME=`%Y-%m-%d_%H-%M-%S`
FILENAME=backup-filmoteka-$DATEANDTIME.tar.gz
SRCDIR=~/apache-tomcat-7.0.81/webapps/filmoteka                   # Location of Important Data Directory (Source of backup).
DESDIR=~/Desktop/Backup            # Destination of backup file.
tar -zcvf $DESDIR/$FILENAME $SRCDIR
#END