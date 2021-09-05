#! /bin/bash

[ -z "${MQTTHOST}" ] && MQTTHOST="localhost"
[ -z "${MQTTPORT}" ] && MQTTPORT=1883

while read msg;
do
   find sounds/ -type f -print0 | shuf -zn1 | xargs -0 play &`
done < <(mosquitto_sub -h "$MQTTHOST" -p "$MQTTPORT" -t team/scored)
