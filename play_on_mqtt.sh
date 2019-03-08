#! /bin/bash

[ -z "${MQTTHOST}" ] && MQTTHOST="localhost"
[ -z "${MQTTPORT}" ] && MQTTPORT=1883

while read msg;
do
   score=`echo $msg | jq -j .score[0,1]`
   [ "$score" != "00" ] && play `find /sounds -maxdepth 1 -name "*.wav" -print | shuf | head -1` &
done < <(mosquitto_sub -h "$MQTTHOST" -p "$MQTTPORT" -t score)

