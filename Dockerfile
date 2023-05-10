FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y curl git build-essential ffmpeg arduino-mk && apt-get clean

RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/usr/local/bin sh

RUN arduino-cli config init

RUN arduino-cli config add board_manager.additional_urls https://raw.githubusercontent.com/sparkfun/Arduino_Apollo3/main/package_sparkfun_apollo3_index.json

RUN arduino-cli core update-index
RUN arduino-cli core install "Sparkfun:apollo3"

RUN arduino-cli lib update-index

RUN arduino-cli lib install "Embedded Template Library ETL"
RUN touch /root/Arduino/libraries/Embedded_Template_Library_ETL/src/etl.h
RUN arduino-cli lib install Time
RUN arduino-cli lib install "SparkFun Qwiic Power Switch Arduino Library"
RUN arduino-cli lib install "SparkFun u-blox GNSS Arduino Library"
RUN arduino-cli lib install IridiumSBDi2c
RUN arduino-cli lib install "Adafruit LSM6DS"
RUN arduino-cli lib install "Adafruit BusIO"
RUN arduino-cli lib install "Adafruit LIS3MDL"
RUN arduino-cli lib install "Adafruit AHRS"

WORKDIR /work

RUN git clone https://github.com/jerabaul29/OpenMetBuoy-v2021a.git

