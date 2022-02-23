#Download base image ubuntu 20.04
FROM ubuntu:20.04

# LABEL about the custom image
LABEL maintainer="Marco"
LABEL version="0.1"
LABEL description="This is custom Docker Image for ipxe Server"

# Disable Prompt During Packages Installation
# ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt-get update

# Install needed Apps
RUN apt-get install -y tftpd-hpa xinetd ipxe supervisor
RUN apt-get clean

# Verzeichnis anlegen
RUN mkdir -p /tftpboot
RUN mkdir -p /tftpboot/menue
RUN mkdir -p /var/log/supervisor


# Files kopieren
RUN cp /usr/lib/ipxe/undionly.kpxe /tftpboot/
RUN cp /usr/lib/ipxe/ipxe.efi /tftpboot/

EXPOSE 69/udp
VOLUME /tftpboot


# Copy Start Script and run
RUN echo "**** copying files ****"
COPY ./supervisord.conf /etc/supervisor/supervisord.conf
COPY ./tftpd-hpa /etc/default/tftpd-hap
COPY ./tftp /etc/xinetd.d/tftp
COPY ./start.sh /start.sh

CMD ["sh","/start.sh"]
