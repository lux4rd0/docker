defunct=$(ps -ef | grep [d]efunct | awk '{print $3}' | head -n1 | egrep -v '^1$')

kill ${defunct} 2>&1
