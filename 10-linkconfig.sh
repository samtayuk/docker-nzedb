#!/bin/bash
set -eo pipefail

if [ ! -e '/config/config.php' ]; then
    echo "  ** Copying default config.php file"
    touch /config/config.php
    chown www-data:www-data /config/config.php
    echo "  ** Linking config.php file"
    ln -s /config/config.php /app/nzedb/nzedb/config/config.php
fi

if [ ! -e '/config/settings.php' ]; then
    echo "  ** Copying default settings.php file"
    cp /app/nzedb/nzedb/config/settings.example.php /config/settings.php
    chown www-data:www-data /config/settings.php
    echo "  ** Linking settings.php file"
    ln -s /config/settings.php /app/nzedb/nzedb/config/settings.php
fi

if [ ! -e '/app/nzedb/nzedb/config/config.php' ]; then
    echo "  ** Linking config.php file"
    ln -s /config/config.php /app/nzedb/nzedb/config/config.php
fi

if [ ! -e '/app/nzedb/nzedb/config/settings.php' ]; then
    echo "  ** Linking settings.php file"
    ln -s /config/settings.php /app/nzedb/nzedb/config/settings.php
fi
