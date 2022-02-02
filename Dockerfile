FROM boxinaclosedbox/ubuntu-web-terminal:latest
RUN apt-get update && apt-get upgrade -y

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y apt-utils
RUN apt-get install -y --no-install-recommends build-essential cmake git libjson-c-dev libwebsockets-dev openssh-server fakechroot rsync sudo fakeroot neofetch rename git nano wget aria2 curl tigervnc-standalone-server
RUN wget https://ftp.gnu.org/gnu/bash/bash-5.1.tar.gz --no-check-certificate ; tar xvf bash-5.1.tar.gz ; cd bash-5.1 ; ./configure ; make ; sudo make install ; cd - ; rm -rf bash-5.1*

COPY .bashrc $HOME/.bashrc

ADD https://github.com/tsl0922/ttyd/releases/download/1.6.1/ttyd_linux.x86_64 /usr/local/bin/ttyd
RUN chmod +x /usr/local/bin/ttyd
COPY start.sh $HOME/start.sh
CMD ["bash","start.sh"]
