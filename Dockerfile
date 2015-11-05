FROM gshipley/javabase:latest
MAINTAINER Grant Shipley, https://github.com/gshipley
RUN curl http://www.blisshq.com/app/latest-linux-version|xargs wget -O /tmp/latest.jar

RUN echo INSTALL_PATH=/bliss > /tmp/auto-install.properties
RUN java -jar /tmp/latest.jar -options /tmp/auto-install.properties
RUN ln -s /config /root/.bliss
CMD /bliss/bin/bliss.sh

VOLUME /config
VOLUME /music

EXPOSE 3220 3221

