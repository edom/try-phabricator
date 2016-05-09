#!/bin/bash
DIRS='
    /var/lib/mysql
    /var/log/mysql
    /var/run/mysqld
'
mkdir -p $DIRS
if [ ! -d /var/lib/mysql/mysql ] ; then
    echo Initializing /var/lib/mysql
    cp -a -T /var/lib/mysql-init /var/lib/mysql
fi
chown -R mysql:mysql $DIRS
tail -F /var/log/mysql/error.log &
exec /usr/sbin/mysqld
