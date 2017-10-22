#!/bin/bash

#Purpose = Backup of photos in Filmoteka

#START

DATEANDTIME=`date +%Y-%m-%d_%H-%M-%S`
FILENAME=backup-filmoteka-database-$DATEANDTIME.sql
DESDIR=/home/pi/Documents/Filmoteka/Backup              # Destination of backup file.
mysqldump -u root -p Filmoteka > $DESDIR/$FILENAME

#END
