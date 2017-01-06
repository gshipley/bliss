FROM gshipley/javabase:latest
MAINTAINER Grant Shipley, https://github.com/gshipley


# Rev-locking this to ensure reproducible builds
RUN wget -O /tmp/runas.sh 'https://raw.githubusercontent.com/coppit/docker-inotify-command/dd981dc799362d47387da584e1a276bbd1f1bd1b/runas.sh'
RUN chmod +x /tmp/runas.sh


# Run as root by default

ENV USER_ID 0
ENV GROUP_ID 0
ENV UMASK 0000


RUN curl http://www.blisshq.com/app/latest-linux-version|xargs wget -O /tmp/latest.jar

RUN echo INSTALL_PATH=/bliss > /tmp/auto-install.properties
RUN java -jar /tmp/latest.jar -options /tmp/auto-install.properties
RUN ln -s /config /root/.bliss
CMD /files/runas.sh $USER_ID $GROUP_ID $UMASK /bliss/bin/bliss.sh

VOLUME /config
VOLUME /music

EXPOSE 3220 3221

