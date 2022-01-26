FROM gns3/openvswitch:latest

RUN apk update --no-cache
RUN apk add openrc

COPY config.sh /config.sh
COPY entry.sh /entry.sh

RUN chmod +x /config.sh
RUN chmod +x /entry.sh

ENTRYPOINT /entry.sh
