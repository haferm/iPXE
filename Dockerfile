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
RUN apt-get install -y tftpd-hpa ipxe supervisor
RUN apt-get clean

# Verzeichnis anlegen
RUN mkdir /srv/tftp/menue

# Files kopieren
RUN cp /usr/lib/ipxe/undionly.kpxe /srv/tftp/
RUN cp /usr/lib/ipxe/ipxe.efi /srv/tftp/

# Volume configuration
VOLUME ["/srv/tftp", "/etc/default"]

# Expose Port and Volume for the Application
EXPOSE 66
VOLUME /srv/tftp
VOLUME /etc/default


# Copy Start Script and run
RUN echo "**** cleanup ****"
COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY start.sh /start.sh
CMD ["sh","/start.sh"]
