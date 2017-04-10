FROM fedora:26

RUN dnf install -y --setopt=tsflags=nodocs haproxy which bash && \
    dnf -y clean all

ENV NAME=haproxy
LABEL MAINTAINER "Petr Hracek" <phracek@redhat.com>
LABEL summary="HAProxy reverse proxy for high availability environments." \
    Name="$FGC/$NAME" \
    Version="0" \
    Release="1.$DISTTAG" \
    Architecture="$ARCH" \
    BZComponent=$NAME \
    Usage="docker run -p 80:80 docker.io/modularityimages/haproxy" \
    Help="Runs haproxy, which listens on port 80. No dependencies. See Help File below for more details." \
    description="HAProxy is a TCP/HTTP reverse proxy which is particularly suited for high availability environments." \
    io.k8s.description="HAProxy is a TCP/HTTP reverse proxy which is particularly suited for high availability environments." \
    io.k8s.diplay-name="HAProxy 1.6 " \
    io.openshift.expose-services="80:haproxy" \
    io.openshift.tags="haproxy"

EXPOSE 80

ADD files /files
ADD help.md README.md /

ENTRYPOINT ["/files/docker-entrypoint.sh"]
CMD ["/usr/sbin/haproxy", "-p", "/run/haproxy.pid", "-f", "/etc/haproxy/haproxy.cfg", "-D", "s"]

