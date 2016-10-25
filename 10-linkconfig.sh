#!/bin/bash
set -eo pipefail

if [ ! -e '/config/config.php' ]; then
    echo "  ** Copying default config.php file"
    touch /config/config.php
    chown www-data:www-data /config/config.php
fi

if [ ! -e '/config/settings.php' ]; then
    echo "  ** Copying default settings.php file"
    cp /app/nzedb/nzedb/config-sample/settings.example.php /config/settings.php
    chown www-data:www-data /config/settings.php
fi

if [ ! -e '/config/Configure.php' ]; then
    echo "  ** Copying Configure.php file"
    cp /app/nzedb/nzedb/config-sample/Configure.php /config/Configure.php
    chown www-data:www-data /config/Configure.php
else
  echo "  ** Updating Configure.php file"
  rm -f /config/Configure.php
  cp /app/nzedb/nzedb/config-sample/Configure.php /config/Configure.php
  chown www-data:www-data /config/Configure.php
fi

if [ ! -e '/data/covers' ]; then
    echo "  ** Copying default covers dir"
    cp /app/nzedb/resources/covers-sample /data/covers
    chown www-data:www-data /data/covers
    chmod -R 777 /data/covers
fi

if [ ! -e '/app/nzedb/nzedb/config' ]; then
    echo "  ** Removing old config dir link"
    rm /app/nzedb/nzedb/config
fi

echo "  ** linking conf dir"
ln -s /config /app/nzedb/nzedb/config
chown www-data:www-data /app/nzedb/nzedb/config


if [ ! -e '/app/nzedb/resources/covers' ]; then
    echo "  ** Removing old config dir link"
    rm /app/nzedb/resources/covers
fi

echo "  ** linking conf dir"
ln -s /data/covers /app/nzedb/resources/covers
chown www-data:www-data /app/nzedb/resources/covers
chmod -R 777 /app/nzedb/resources/covers
