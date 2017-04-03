FROM fedora:26

RUN dnf install -y --setopt=tsflags=nodocs haproxy which bash && \
    dnf -y clean all

LABEL summary="HAProxy reverse proxy for high availability environments." \
    Name="$FGC/haproxy" \
    Version="0" \
    Release="1.$DISTTAG" \
    Architecture="$ARCH" \
    Usage="docker run -p 80:80 docker.io/modularityimages/haproxy"
    description="HAProxy is a TCP/HTTP reverse proxy which is particularly suited for high availability environments." \
    io.k8s.description="HAProxy is a TCP/HTTP reverse proxy which is particularly suited for high availability environments." \
    io.k8s.diplay-name="HAProxy 1.6 " \
    io.openshift.tags="haproxy"

EXPOSE 80

ADD files /files
ADD help.md README.md /
LABEL MAINTAINER "Petr Hracek" <phracek@redhat.com>

ENTRYPOINT ["/files/docker-entrypoint.sh"]
CMD ["/usr/sbin/haproxy", "-p", "/run/haproxy.pid", "-f", "/etc/haproxy/haproxy.cfg", "-D", "s"]

