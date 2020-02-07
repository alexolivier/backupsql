#!/bin/bash
#Edit cronjob file
sed -i "s/SQL_host/${SQL_host}/" /config/cronjob
sed -i "s/SQL_user/${SQL_user}/" /config/cronjob
sed -i "s/SQL_pwd/${SQL_pwd}/" /config/cronjob
sed -i "s/SQL_port/${SQL_port}/" /config/cronjob
sed -i "s/BACKUPCOPIES/${BackupCopies}/" /config/cronjob

#Edit crontab.txt file
sed -i "s/MINUTE/${bkpMinute}/" /config/crontab.txt
sed -i "s/HOUR/${bkpHour}/" /config/crontab.txt
sed -i "s/DAYM/${bkpDayOfMonth}/" /config/crontab.txt
sed -i "s/MONTH/${bkpMonth}/" /config/crontab.txt
sed -i "s/DAYW/${bkpDayOfWeek}/" /config/crontab.txt

export TERM=dumb

crontab /config/crontab.txt



