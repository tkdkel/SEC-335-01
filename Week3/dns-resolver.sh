#!/bin/bash

network_prefix=$1
dns=$2

# Ensure there are two arguments provided
if [[ -z "$network_prefix" || -z "$dns" ]]; then
    echo "Usage: $0 <network_prefix> <dns_server>"
    exit 1
fi

# Iterate through each IP in the /24 range
for i in $(seq 1 254); do
    ip="${network_prefix}.${i}"
    
    # Use nslookup and specify the DNS server, capture output if successful
    result=$(nslookup $ip $dns 2>&1)
    
    if [[ $? -eq 0 && ! $result =~ "can't find" ]]; then
        echo "$result"
    fi
done


