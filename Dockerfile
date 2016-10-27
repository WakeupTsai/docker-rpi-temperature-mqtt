FROM jsurf/rpi-raspbian:latest
RUN [ "cross-build-start" ]
RUN mkdir -p /temper
COPY temper /temper
RUN apt-get update && apt-get install -y \
        mosquitto \
        mosquitto-clients \
        libusb-dev \
	libusb-1.0-0-dev && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /temper
CMD [ "sh", "run.sh" ]
