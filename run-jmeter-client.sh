#!/bin/bash

# ./run-jmeter-client.sh [IF_NAME] [JMX_FILE] [JTL_LOGS_FILE]
# Example: ./run-jmeter-client.sh ens2 my_plan_test.jmx my_test_outputs.jtl

ifname="$1"
ip4=$(ip -o addr show up primary scope global $ifname | awk '{print $4}' | cut -d/ -f1)
nbthreads='15'
cd /opt/apache-jmeter/bin
# argument -n means no-gui and -r start on remote servers
./jmeter -Djava.rmi.server.hostname=$ip4 -n -r -t $2 -l $3 $4
cd -