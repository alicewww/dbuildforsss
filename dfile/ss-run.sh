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
		/usr/bin/ss-server -s 0.0.0.0 -p 20000 -k ${PASSWD} -m aes-128-cfb -u --fast-open &
		while true
		do 
			if [ "$(date +%H%M)" == "0300" ]; then
				break
			fi
			sleep 60
		done
		jobs -l | grep ss-server | awk '{print $2}' | xargs kill -9
		fg
	done
} >>/ss/ss.log 2>&1
