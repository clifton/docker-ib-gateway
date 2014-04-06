FROM clifton/debian-java8-clojure
MAINTAINER clifton <cliftonk@gmail.com>

# install xvfb and other X dependencies for IB
RUN apt-get update -y
RUN apt-get install -y xvfb libxrender1 libxtst6 x11vnc

# download and install the IB-gateway
RUN curl -O http://download2.interactivebrokers.com/download/unixmacosx.jar \
  && jar xf unixmacosx.jar \
  && mv /IBJts /ib-gateway

# install init scripts and binaries
ADD config/jts.ini /ib-gateway/jts.ini
ADD init/xvfb_init /etc/init.d/xvfb
ADD init/vnc_init /etc/init.d/vnc
ADD bin/xvfb-daemon-run /usr/bin/xvfb-daemon-run
ADD bin/run-gateway /usr/bin/run-gateway

# vnc (optional)
# set your own password to launch vnc
# ENV VNC_PASSWORD doughnuts
# EXPOSE 5900

ENV DISPLAY :0

CMD ["/usr/bin/run-gateway"]
