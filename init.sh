#!/bin/bash

if [ -e /app/etc/sources.list ]; then
  rm -f /etc/atp/sources.list
  cp /app/etc/sources.list /etc/apt/
fi

apt-get update
apt-get install -y --no-install-recommends msmtp

RCFile=/etc/msmtprc
LOGFile=/var/log/msmtp.log

echo "defaults" > $RCFile
echo "" >> $RCFile
echo "account default" >> $RCFile
echo "host $SMTP_HOST" >> $RCFile
echo "auth $SMTP_AUTH" >> $RCFile
echo "port $SMTP_PORT" >> $RCFile
echo "user $SMTP_USER" >> $RCFile
echo "password $SMTP_PASS" >> $RCFile
echo "logfile $LOGFile" >> $RCFile

chmod 0600 $RCFile
echo '' > $LOGFile
chown 32767:32767 $LOGFile
chown 32767:32767 $RCFile
