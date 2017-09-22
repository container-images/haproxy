% HAPROXY(1) Container Image Pages
% Petr Hracek
% September 22, 2017

# NAME
{{ spec.envvars.name }} - {{ spec.short_description }}

# DESCRIPTION
{{ spec.description }}

The container itself consists of:
    - {{ config.os.version }} base image
    - {{ spec.envvars.name }} RPM package

Files added to the container during docker build include: /files/haproxy.sh

# USAGE
To get the memcached container image on your local system, run the following:

    docker pull docker.io/modularitycontainers/{{ spec.envvars.name }}
    
# SECURITY IMPLICATIONS 
Lists of security-related attributes that are opened to the host.

-p {{ spec.http_port }}:{{ spec.http_port }}
    Opens container port {{ spec.http_port }} and maps it to the same port on the host.

# SEE ALSO
HAProxy page
<https://haproxy.org/>
<https://www.digitalocean.com/community/tutorials/how-to-use-haproxy-to-set-up-http-load-balancing-on-an-ubuntu-vps>
