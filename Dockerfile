FROM registry.fedoraproject.org/f26-modular/boltron

ENV NAME=haproxy ARCH=x86_64
LABEL MAINTAINER "Petr Hracek" <phracek@redhat.com>
LABEL summary="HAProxy reverse proxy for high availability environments." \
    name="$FGC/$NAME" \
    version="0" \
    release="1.$DISTTAG" \
    architecture="$ARCH" \
    com.redhat.component=$NAME \
    usage="docker run -p 80:80 docker.io/modularitycontainers/haproxy" \
    help="Runs haproxy, which listens on port 80. No dependencies. See Help File below for more details." \
    description="HAProxy is a TCP/HTTP reverse proxy which is particularly suited for high availability environments." \
    io.k8s.description="HAProxy is a TCP/HTTP reverse proxy which is particularly suited for high availability environments." \
    io.k8s.diplay-name="HAProxy 1.6 " \
    io.openshift.expose-services="80:haproxy" \
    io.openshift.tags="haproxy"

RUN dnf --nodocs -y install --rpm which && \
    dnf --nodocs -y install haproxy && \
    dnf clean all

EXPOSE 5000

ADD files /files
ADD help.md /

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/haproxy", "-f", "/etc/haproxy/haproxy.cfg", "-db"]

