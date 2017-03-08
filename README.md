# haproxy

HAProxy reverse proxy for high availability environments.

## Summary

- Dockerfile - build container image with haproxy.
- openshift-template.yml - Template for OpenShift to haproxy.

## How to use the container

* Copy ```./examples/haproxy.cfg``` to ```/etc/haproxy/haproxy.cfg```
* Run two HTTPD servers on ```IP1```:```port1``` and ```IP2```:```port2```
* Modify ```/etc/haproxy/haproxy.cfg``` so it uses relevant addresses and ports.
 
Command for running haproxy docker container:

```bash
docker run -it n
```

## How to run haproxy as standalone container

Copy haproxy-container.service to ```/usr/lib/systemd/system/``` directory
```bash
sudo cp haproxy-container.service /usr/lib/systemd/system/
systemctl daemon-reload
```

Command for running memcached as standalone container:
```bash
systemctl start haproxy-container
```

## How to stop memcached as standalone container
Command for stopping haproxy as standalone container:
```bash
systemctl stop haproxy-container
```
## How to test the haproxy

Statistic can be seen on haproxy url `http://<haproxy_url>/haproxy?stats`.

