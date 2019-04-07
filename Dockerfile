FROM ubuntu:18.04

RUN apt-get update && apt-get -y install sox pulseaudio mosquitto-clients
ADD sounds /sounds
ADD play_on_mqtt.sh /

ENTRYPOINT ["bash"]
CMD ["/play_on_mqtt.sh"]

