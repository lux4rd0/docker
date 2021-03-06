#!/bin/sh
hosts_dir=/etc/dnsmasq.hosts
unifi_hosts=$hosts_dir/unifi.hosts

[ -d $hosts_dir ] || mkdir $hosts_dir
dnsmasq --keep-in-foreground --hostsdir=$hosts_dir --log-facility=- ${DNSMASQ_OPTS} &

while true; do
    ./get_unifi_reservations.py > /tmp/current_unifi.hosts
    if [ $? = 0 ] && ! diff -N $unifi_hosts /tmp/current_unifi.hosts; then
        mv /tmp/current_unifi.hosts $unifi_hosts
    fi
    sleep ${UNIFI_POLL_INTERVAL:-60}
done
