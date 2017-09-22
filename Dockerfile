FROM {{ config.docker.registry }}/{{ config.docker.from }}

ENV NAME={{ spec.envvars.name }} \
    VERSION={{ spec.envvars.version }} \
    RELEASE={{ spec.envvars.version }} \
    ARCH={{ spec.envvars.arch }}
LABEL maintainer {{ spec.maintainer }}
LABEL summary="{{spec.short_description}}" \
    name="$FGC/$NAME" \
    version="$VERSION" \
    release="$RELEASE.$DISTTAG" \
    architecture="$ARCH" \
    com.redhat.component=$NAME \
    usage="docker run -p {{ spec.http_port }}:{{ spec.http_port }} docker.io/modularitycontainers/{{ spec.envvars.name }}" \
    help="Runs haproxy, which listens on port {{ spec.http_port }}. No dependencies. See Help File below for more details." \
    description="{{ spec.description }}" \
    io.k8s.description="{{ spec.description }}" \
    io.k8s.diplay-name="HAProxy 1.6 " \
    io.openshift.expose-services="{{ spec.http_port }}:{{ spec.envvars.name }}" \
    io.openshift.tags="{{ spec.envvars.name }}"

RUN {{ commands.pkginstaller.install(["which", "haproxy"])}} && \
    {{ commands.pkginstaller.cleancache()}}

EXPOSE {{ spec.expose }}

ADD files /files
ADD root/help.1 /

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/haproxy", "-f", "/etc/haproxy/haproxy.cfg", "-db"]

