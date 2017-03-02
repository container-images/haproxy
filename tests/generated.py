#!/usr/bin/python

import socket
from avocado import main
import moduleframework

if __name__ == '__main__':
    main()

class GeneratedTestsConfig(moduleframework.AvocadoTest):
    """
    :avocado: enable
    """

    def test_processrunning(self):
        self.start()
        self.run("ls  /proc/*/exe -alh | grep haproxy")
