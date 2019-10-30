#!/bin/bash

# ./run-jmeter-server.sh [IF_NAME]
# Example: ./run-jmeter-server.sh ens2

ifname="$1"
ip4=$(ip -o addr show up primary scope global $ifname | awk '{print $4}' | cut -d/ -f1)
cd /opt/apache-jmeter/bin
./jmeter-server -Djava.rmi.server.hostname=$ip4
cd -