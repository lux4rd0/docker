#!/bin/bash
#
# Sonos - Network Bandwidth Usage
#
# sonos-network_bandwidth.sh <hostname>
#
# Provide a Sonos speaker URL and Network Interface and it returns RX and TX metrics, usable as a Cacti script
#
# Dave Schmid, dave@pulpfree.org
#
# version 0.2
# 2020-05-20
# version 0.1
# 2017-10-21
#

# ./influxdb_sonos.sh sonos-office-sub br0

HOSTNAME=$1
INTERFACE=$2
GROUP=$3
MODEL=$4
IPADDRESS=$(getent hosts "${HOSTNAME}" | awk '{ print $1 }')
URL="http://${IPADDRESS}:1400/status/ifconfig"

# rxBytes | txBytes

read -r rxBytes txBytes <<< $(curl -m 5 "${URL}" | grep -A 7 "${INTERFACE}" |grep "RX bytes:" | awk '{print $2,$6;}' | sed -n 1p | sed 's/bytes://g' | awk '{print $1,$2;}' )

# RX packets

read -r rxPackets rxErrors rxDropped rxOverruns rxFrame <<< $(curl -m 5 "${URL}" | grep -A 7 "${INTERFACE}" |grep "RX packets:" | awk '{print $2,$3,$4,$5,$6;}' | sed 's/:/ /g' |awk '{print $2,$4,$6,$8,$10;}' )

# TX packets

read -r txPackets txErrors txDropped txOverruns txCarrier <<< $(curl -m 5 "${URL}" | grep -A 7 "${INTERFACE}" |grep "TX packets:" | awk '{print $2,$3,$4,$5,$6;}' | sed 's/:/ /g' |awk '{print $2,$4,$6,$8,$10;}' )

# collisions queue

read -r collisions txqueuelen <<< $(curl -m 5 "${URL}" | grep -A 7 "${INTERFACE}" |grep "collisions" | awk '{print $1,$2}' | sed 's/:/ /g' | awk '{print $2,$4;}' )

echo "sonos_network,host=${HOSTNAME},interface=${INTERFACE},group=${GROUP},model=${MODEL} rxBytes=${rxBytes},txBytes=${txBytes},rxPackets=${rxPackets},rxErrors=${rxErrors},rxDropped=${rxDropped},rxOverruns=${rxOverruns},rxFrame=${rxFrame},txPackets=${txPackets},txErrors=${txErrors},txDropped=${txDropped},txOverruns=${txOverruns},txCarrier=${txCarrier},collisions=${collisions},txqueuelen=${txqueuelen}"
