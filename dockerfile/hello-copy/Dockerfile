FROM ubuntu:18.04

MAINTAINER maintainer1 <maintainer1@linux.com>

ADD baidu-aip-2.2.18.0.tar.gz /hello/
ADD baidu-aip-2.2.18.0.tar.gz /hello/add
COPY baidu-aip-2.2.18.0.tar.gz /hello/copy1
COPY baidu-aip-2.2.18.0.tar.gz /hello/copy2/

COPY entrypoint.sh /hello/entrypoint.sh

WORKDIR /hello

ENV JAVA_HOME /hello/jdk1.8

# CMD /hello/entrypoint.sh
CMD ["/hello/entrypoint.sh"]
# ENTRYPOINT ["/hello/entrypoint.sh"]
