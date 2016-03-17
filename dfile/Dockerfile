FROM ubuntu:14.04
RUN apt-get update
RUN sudo apt-get install -y build-essential autoconf libtool libssl-dev gawk debhelper dh-systemd init-system-helpers pkg-config
RUN sudo apt-get install -y wget unzip
RUN cd && wget https://github.com/shadowsocks/shadowsocks-libev/archive/master.zip && unzip master.zip && cd shadowsocks-libev-master/ && dpkg-buildpackage -us -uc && cd && dpkg -i shadowsocks-libev*.deb
ADD ss-run.sh /usr/bin/ss-run.sh
ADD ss-rotate.sh /usr/bin/ss-rotate.sh
ADD ss-cron /etc/cron.d/ss-cron
VOLUME /ss
ENTRYPOINT ["/usr/bin/ss-run.sh"]
