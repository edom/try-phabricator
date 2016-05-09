#!/bin/bash
export phabricator_base_uri="${phabricator_base_uri:-http://phabricator.local}"
mysql_host="${mysql_host:-3306}"
mysql_port="${mysql_port:-3306}"
# Wait for mysql to become ready.
sleep 2
while ! mysql --host "$mysql_host" --port "$mysql_port" --protocol tcp </dev/null; do
    sleep 1
done
cd /opt/phabricator
./bin/config set mysql.host "$mysql_host"
./bin/config set mysql.port "$mysql_port"
./bin/config set phabricator.timezone 'UTC'
./bin/config set phabricator.base-uri "$phabricator_base_uri/"
./bin/storage upgrade --force
phab_dirs="/var/repo /var/tmp/phd/log"
mkdir -p $phab_dirs
chown -R www-data:www-data $phab_dirs
./bin/phd start
touch /var/tmp/phd/log/daemons.log
tail -F /var/tmp/phd/log/daemons.log &
source /etc/apache2/envvars
exec /usr/sbin/apache2 -k start -D FOREGROUND
