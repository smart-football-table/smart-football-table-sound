# smart-football-table-sound

Plays sounds on every received ```score``` MQTT message where the score is **not** [ 0, 0 ]

This project uses these sounds from freesound:
goal1, goal3, goal4, goal5, goal6, by alexpadina ( https://freesound.org/people/alexpadina/ )

## MQTT messages
| topic           | Description                    | Example payload |
| --------------- | ------------------------------ |---------------- |
| team/scored     | The id of the team that scored | 1               |

## Docker
```docker run --rm --device=/dev/snd -e MQTTHOST=mqtt -e MQTTPORT=1883 -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native  -v ~/.config/pulse/cookie:/root/.config/pulse/cookie smart-football-table-sound:latest```

