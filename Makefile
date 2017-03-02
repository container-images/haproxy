.PHONY: build run defult

IMAGE_NAME = haproxy

default: run

build:
	docker build --tag=$(IMAGE_NAME) .

run: build
	docker run -d $(IMAGE_NAME)

check:
	./run_tests.sh
