FROM phusion/baseimage:0.9.16
ENV DEBIAN_FRONTEND noninteractive


# Configure user nobody to match unRAID's settings
 RUN \
 usermod -u 99 nobody && \
 usermod -g 100 nobody && \
 usermod -d /home nobody && \
 chown -R nobody:users /home

# Install Dependencies
RUN apt-get update -q
RUN apt-get install -qy mariadb-client

# Create docker folders
RUN mkdir /config && \
mkdir /backup

VOLUME /backup
VOLUME /config

# Add our crontab file
ADD crontab.txt /config/crontab.txt
ADD cronjob /config/cronjob

# Make cronjob executable
RUN chmod +x /config/cronjob

# Add firstrun.sh to execute during container startup, changes mysql host settings.
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh
RUN /etc/my_init.d/firstrun.sh

#RUN cat /config/crontab.txt

#Use the crontab file
RUN crontab /config/crontab.txt

# Start cron
RUN cron
