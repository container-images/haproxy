#!/bin/bash
 
cd tests
/usr/share/moduleframework/tools/generator.py
MODULE=docker avocado run /usr/share/moduleframework/tools/modulelint.py ./*.py
MODULE=rpm avocado run /usr/share/moduleframework/tools/modulelint.py ./*.py

