#!/bin/bash

ERROR=0

if [ -z "$USERNAME" ]; then
  echo "[CRITICAL] username not set"
  ERROR=1
fi

if [ -z "$PASSWORD" ]; then
  echo "[CRITICAL] password not set"
  ERROR=1
fi

if [ -z "$PROXY" ]; then
  echo "[CRITICAL] proxy not set"
  ERROR=1
fi

if [ -z "$PORT" ]; then
  echo "[CRITICAL] port not set"
  ERROR=1
fi

if [ "$ERROR" -ne "0" ]; then
  exit -1
fi

# replace passwords in config file
sed -i "s|USERNAME|$USERNAME|" /etc/squid3/squid.conf
sed -i "s|PASSWORD|$PASSWORD|" /etc/squid3/squid.conf
sed -i "s|PROXY|$PROXY|" /etc/squid3/squid.conf
sed -i "s|PORT|$PORT|" /etc/squid3/squid.conf

/etc/init.d/squid3 start

# attach contaier to log files
tail -f /var/log/squid3/access.log -f /var/log/squid3/cache.log