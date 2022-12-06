#!/bin/sh

# mosdns
/usr/bin/mosdns start --dir /etc/mosdns   > /var/log/start1.log 2>&1 &
# AdGuard
/opt/adguardhome/AdGuardHome -h 0.0.0.0 -c /opt/adguardhome/conf/AdGuardHome.yaml -w /opt/adguardhome/work > /var/log/start2.log 2>&1 &

# just keep this script running
while [[ true ]]; do
	    sleep 1
    done
