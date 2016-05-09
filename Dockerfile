FROM ubuntu:14.04
MAINTAINER software@spacetimecat.com

ADD files-0 /

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git openssh-client apache2 dpkg-dev \
        php5 php5-mysql php5-gd php5-dev php5-curl php-apc php5-cli php5-json \
        mariadb-server-5.5 && \
    service apache2 stop && \
    service mysql stop && \
    rm -rf /etc/apache2 /etc/mysql /etc/php5 && \
    mv -T /var/lib/mysql /var/lib/mysql-init

ADD files-1 /
