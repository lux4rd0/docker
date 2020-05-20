rm -rf /mnt/docker/telegraf/docker/telegraf.d/*.conf
 
cat /mnt/docker/telegraf/docker/hosts.txt | while read line

do

sigil -p -f /mnt/docker/telegraf/docker/telegraf-template.conf host=${line} > /mnt/docker/telegraf/docker/telegraf.d/${line}.conf

done
