#!/bin/bash

db_name="mastodon_production"
bak_dir="/var/lib/postgresql/backup"

pg_dump -d ${db_name} -f $bak_dir/${db_name}_$(date +%Y%m%d).sql

#remove out-date backup
find $bak_dir -name "$db_name*.sql" -type f -mtime +7 -exec rm -rf {} \; > /dev/null 2>&1

#33 5 * * * /bin/bash /var/lib/postgresql/backup/backup.sh >> $HOME/crontab.log 2>&1