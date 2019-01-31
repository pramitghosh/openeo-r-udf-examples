#!/bin/bash
declare -a responses
json=$1
endpoint=$2
host=$3
port=$4
maxtests=$5
for i in `seq 1 $maxtests`;
do
	echo -e "Started test #$i/$maxtests for file: $json at `date -u`\n====================================================================================\n"
	SECONDS=0
	responses[$i]=`curl -v -H "application/json" -d @"$json" $host:$port$endpoint`
	duration=$SECONDS
	echo -e "Completed test #$i in $duration seconds.\n"
done
#echo ${responses[*]}
