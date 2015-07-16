#!/bin/bash -x
{
	cron

	PASSWD="darkflamemasterdarkflamedragon"
	if [ "$1" != "" ]; then
		PASSWD="$1"
	fi

	while true
	do
		/usr/bin/ss-server -s 0.0.0.0 -p 20000 -k ${PASSWD} -m aes-128-cfb -u --fast-open &
		sleep 60
		jobs -l | grep ss-server | awk '{print $2}' | xargs kill
		fg
	done
} >>/ss/ss.log 2>&1
