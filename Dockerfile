FROM centos:7
MAINTAINER Kyle Shenk <k.shenk@gmail.com>

RUN yum install -y memcached && yum clean all

RUN mkdir -p /var/log/memcached /var/run/memcached && \
    chown memcached:memcached /var/log/memcached /var/run/memcached

EXPOSE 11211

CMD ["/usr/bin/memcached", "-P", "/var/run/memcached/memcached.pid", "logfile", "/var/log/memcached/memcached.log", "-m", "48", "-t", "4", "-l", "0.0.0.0", "-p", "11211", "-u", "memcached", "-c", "1024", "-R", "20", "-B", "auto"]

