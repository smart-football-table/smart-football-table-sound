#! /bin/bash

[ -z "${MQTTHOST}" ] && MQTTHOST="localhost"
[ -z "${MQTTPORT}" ] && MQTTPORT=1883

FILES=(/sounds/*)

while read msg;
do
   play "${FILES[RANDOM % ${#FILES[@]}]}" &
done < <(mosquitto_sub -h "$MQTTHOST" -p "$MQTTPORT" -t team/scored)
