FROM kalilinux/kali:latest
RUN apt-get update && apt-get upgrade -y

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y apt-utils
RUN apt-get install -y --no-install-recommends build-essential cmake git libjson-c-dev libwebsockets-dev openssh-server fakechroot rsync sudo fakeroot neofetch rename git nano wget aria2 curl tigervnc-standalone-server

COPY root.sh /usr/local/bin/root.sh
COPY .bashrc $HOME/.bashrc

ADD https://github.com/tsl0922/ttyd/releases/download/1.6.1/ttyd_linux.x86_64 /usr/local/bin/ttyd
RUN chmod +x /usr/local/bin/ttyd
