#! /bin/bash

network=$1
port=$2

echo "host,port"
for host in $(seq 1 254); do
  target_host="$network.$host"
  timeout 0.1 bash -c "echo >/dev/tcp/$target_host/$port" 2>/dev/null &&
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $target_host,$port"
done
