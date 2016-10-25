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

if [ ! -e '/app/nzedb/nzedb/config' ]; then
    echo "  ** Removing old link"
    rm /app/nzedb/nzedb/config
fi

echo "  ** linking conf dir"
ln -s /config /app/nzedb/nzedb/config
chown www-data:www-data /app/nzedb/nzedb/config
