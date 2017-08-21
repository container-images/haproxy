.PHONY: build run defult

IMAGE_NAME = modularitycontainers/haproxy

default: run

build:
	docker build --tag=$(IMAGE_NAME) .

run: build
	docker run -d $(IMAGE_NAME)

test:
	cd tests && MODULE=docker avocado run /usr/share/moduleframework/tools/modulelint.py ./*.py
	# commented out b/c the first test is container specific
	# cd tests && MODULE=rpm avocado run  ./*.py
