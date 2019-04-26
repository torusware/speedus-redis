FROM redis:4.0
LABEL maintainer="The Speedus Team <speedus@torusware.com>"

ENV ROOT_HOME /root
ENV SPEEDUS_DIR /opt/torusware/speedus
ENV NETPIPE_DIR $SPEEDUS_DIR/benchmarks/NetPIPE-C

RUN apt-get update \
 && apt-get -qqy install wget unzip make gcc \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/torusware \
 && cd /opt/torusware \
 && wget http://dl.torusware.com/speedus/release/speedus-latest-linux.zip \
 && unzip speedus-latest-linux.zip \
 && rm speedus-latest-linux.zip \
 && ln -s speedus-b* $SPEEDUS_DIR \
 && cp $SPEEDUS_DIR/doc/README.image.txt $ROOT_HOME/SPEEDUS_README.txt

RUN cd $NETPIPE_DIR \
 && make \
 && cp NPtcp /usr/bin/NPtcp

COPY speedus /usr/local/bin/speedus
COPY docker-entrypoint.sh /usr/local/bin/speedus-entrypoint.sh

WORKDIR /data
ENTRYPOINT ["speedus-entrypoint.sh"]
CMD ["redis-server"]
