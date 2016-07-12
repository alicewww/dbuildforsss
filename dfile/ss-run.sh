#!/bin/bash -x
{
	cron

	PASSWD="$1"

	cd /root/gopath/bin/
	echo "
{
    \"server\":\"127.0.0.1\",
    \"server_port\":10000,
    \"local_port\":20000,
    \"password\":\"$PASSWD\",
    \"method\": \"aes-256-cfb-auth\",
    \"timeout\":600
}
" > config.json

	./shadowsocks-server -d

} >>/ss/ss.log 2>&1
