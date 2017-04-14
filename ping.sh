#!/bin/sh
# http://www.linuxforums.org/forum/programming-scripting/102812-bash-script-log-ping-requests.html
# while bash ~/documents/201704-ping_test/ping.sh; do :; done
NOW=$(date +"%T %m/%d/%Y")
PING=$(ping -qc 5 www.google.com | grep '5 packets')
echo $NOW: $PING >> ~/documents/201704-ping_test/ping.log
sleep 30
exit 0