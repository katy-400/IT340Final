#!/bin/bash


FILE="$1" 
DAYS="$2"
CURDATE=$(date '+%b %d')
PREVDATE=$(date -d $DAYS+' days ago' '+%b %d')

#echo ' arg1: ' + $FILE + ' arg1: ' + $DAYS 
#echo $CURDATE + $PREVDATE
#curdate - days, curdate

COUNT=$(awk "/$PREVDATE/,/$CURDATE/" $FILE | grep -i -c 'error')
echo 'ERRORS in ' $FILE ' from ' $(date -d $DAYS '+%b %d') ': ' $COUNT >> /var/log/katt.log
