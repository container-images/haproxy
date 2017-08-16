#!/usr/bin/python

from avocado import main
from moduleframework import module_framework


class SanityCheck1(module_framework.AvocadoTest):
    """
    :avocado: enable
    """

    def test_process_is_running(self):
        self.start()
        self.run("cat /proc/1/cmdline | egrep '^/usr/sbin/haproxy'")

    def test_haproxy_accepts_connections(self):
        self.start()
        self.run("curl http://localhost:5000/")


if __name__ == '__main__':
    main()
