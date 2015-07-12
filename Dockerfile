FROM orgsync/java8
MAINTAINER clifton <cliftonk@gmail.com>

# install xvfb and other X dependencies for IB
RUN apt-get update -y \
    && apt-get install -y xvfb libxrender1 libxtst6 x11vnc socat \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN mkdir /ib-gateway
WORKDIR /ib-gateway

# download and install the IB-gateway
RUN wget -O total.jar -q https://download2.interactivebrokers.com/java/classes/total.2015.jar \
    && wget -O jts.jar -q https://download2.interactivebrokers.com/java/classes/latest/jts.latest.jar

# install init scripts and binaries
ADD config/jts.ini /ib-gateway/jts.ini
ADD init/xvfb_init /etc/init.d/xvfb
ADD init/vnc_init /etc/init.d/vnc
ADD bin/xvfb-daemon-run /usr/bin/xvfb-daemon-run
ADD bin/run-gateway /usr/bin/run-gateway

# vnc (optional)
# set your own password to launch vnc
# ENV VNC_PASSWORD doughnuts

# 5900 for VNC, 4003 for the gateway API via socat
EXPOSE 5900 4003

ENV DISPLAY :0

CMD ["/usr/bin/run-gateway"]
