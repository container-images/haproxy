# haproxy

HAProxy is a reverse proxy for high availability environments.


## How to use the container

Pull the image from Docker Hub:

```bash
$ sudo docker pull modularitycontainers/haproxy
```

Run the container:

```bash
$ sudo docker run -p 80:80 --name haproxy modularitycontainers/haproxy
```


## A demo

Here is a simple demo where HAProxy balances load between two httpd backend servers:

* Copy `haproxy.cfg` config to a well-known location:
  ```bash
  $ sudo mkdir -p /etc/haproxy
  $ sudo cp -av ./examples/haproxy.cfg /etc/haproxy/haproxy.cfg
  ```
* Run two httpd backend servers:
  ```bash
  $ sudo docker run -d -p 8000:8080 --name httpd1 modularitycontainers/httpd
  $ sudo docker run -d -p 8001:8080 --name httpd2 modularitycontainers/httpd
  ```
* Copy systemd service which will take care of haproxy container:
  ```bash
  $ sudo cp -av haproxy-container.service /usr/lib/systemd/system/
  $ sudo systemctl daemon-reload
  ```
* We can start haproxy now:
  ```bash
  $ sudo systemctl start haproxy-container
  ```
* You should be able to open localhost now and see you are being routed to httpd via haproxy:
  ```bash
  $ curl -L -v http:/localhost:80
  * Unwillingly accepted illegal URL using 1 slash!
  * Rebuilt URL to: http://localhost:80/
  *   Trying ::1...
  * TCP_NODELAY set
  * connect to ::1 port 80 failed: Connection refused
  *   Trying 127.0.0.1...
  * TCP_NODELAY set
  * Connected to localhost (127.0.0.1) port 80 (#0)
  > GET / HTTP/1.1
  > Host: localhost
  > User-Agent: curl/7.54.1
  > Accept: */*
  >
  < HTTP/1.1 403 Forbidden
  < Date: Fri, 14 Jul 2017 13:11:09 GMT
  < Server: Apache/2.4.26 (Fedora)
  < Last-Modified: Fri, 30 Jun 2017 14:42:29 GMT
  < ETag: "122f-5532e6d2fbf40"
  < Accept-Ranges: bytes
  < Content-Length: 4655
  < Content-Type: text/html; charset=UTF-8
  <
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
  ```


## Repository Structure

- Dockerfile - build container image with haproxy.
- openshift-template.yml - Template for OpenShift to haproxy.
