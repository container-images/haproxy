% HAPROXY(1) Container Image Pages
% Petr Hracek
% March 2, 2017

# NAME
haproxy - HAProxy reverse proxy for high availability environments.

# DESCRIPTION
HAProxy is a TCP/HTTP reverse proxy which is particularly suited for high availability environments.

The container itself consists of:
    - fedora/26 base image
    - haproxy RPM package

Files added to the container during docker build include: /files/haproxy.sh

# USAGE
To get the memcached container image on your local system, run the following:

    docker pull hub.docker.io/phracek/haproxy 
    
# SECURITY IMPLICATIONS 
Lists of security-related attributes that are opened to the host.

-p 80:80
    Opens container port 80 and maps it to the same port on the host.

# SEE ALSO
HAProxy page
<https://haproxy.org/>
<https://www.digitalocean.com/community/tutorials/how-to-use-haproxy-to-set-up-http-load-balancing-on-an-ubuntu-vps>
