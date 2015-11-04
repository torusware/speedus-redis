# Speedus container for Redis
From redis:2.6-32bit
MAINTAINER Jorge Docampo <jorge.docampo@torusware.com>

ENV root_home /root

RUN apt-get clean && apt-get update \
 && apt-get -qqy install wget unzip make gcc lib32gcc1 \
 && rm -rf /var/lib/apt/lists/*

ENV speedus_dir /opt/torusware/speedus
ENV netpipe_dir $speedus_dir/benchmarks/NetPIPE-C

WORKDIR /opt
RUN mkdir torusware \
 && cd torusware \
 && wget http://dl.torusware.com/speedus/release/speedus-latest-linux.zip \
 && unzip speedus-latest-linux.zip \
 && rm speedus-latest-linux.zip \
 && ln -s speedus-b* speedus \
 && cp speedus/doc/README.image.txt $root_home/SPEEDUS_README.txt

WORKDIR /root
ADD speedus /usr/bin/speedus 

WORKDIR $netpipe_dir
RUN make
RUN cp NPtcp /usr/bin/NPtcp

#Added our own entrypoint just adding speedus command to it
COPY docker-entrypoint.sh /entrypoint.sh

WORKDIR /data
