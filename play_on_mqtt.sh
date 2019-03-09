#! /bin/bash

[ -z "${MQTTHOST}" ] && MQTTHOST="localhost"
[ -z "${MQTTPORT}" ] && MQTTPORT=1883

FILES=(/sounds/*)

while read msg;
do
   score=`echo $msg | jq -j .score[0,1]`
   [ "$score" != "00" ] && play "${FILES[RANDOM % ${#FILES[@]}]}" &
done < <(mosquitto_sub -h "$MQTTHOST" -p "$MQTTPORT" -t game/score)
