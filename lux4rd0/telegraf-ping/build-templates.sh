rm -rf /mnt/docker/telegraf/ping/telegraf.d/*.conf

cat /mnt/docker/telegraf/ping/hosts.txt | while read line

do

sigil -p -f /mnt/docker/telegraf/ping/telegraf-template.conf host=${line} > /mnt/docker/telegraf/ping/telegraf.d/${line}.conf

done
