#!/bin/bash


FILE="$1"
DAYS="$2"
CURDATE=$(date '+%b %d')
PREVDATE=$(date -d $DAYS+' days ago' '+%b %d')

#echo 'first arg: ' + $FILE + " second arg: " + $DAYS 
#echo $CURDATE + $PREVDATE
#curdate - days, curdate

ERRORCNT=$(awk "/$PREVDATE/,/$CURDATE/" $FILE | grep -i -c 'error')
echo 'Number of ERRORS for ' $FILE ' since ' $(date -d $DAYS+' days ago' '+%b %d') ': ' $ERRORCNT >> /var/log/katt.log
