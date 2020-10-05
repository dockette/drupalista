.PHONY: build

build: build-web build-redis

build-web:
	docker build -t drupalista/web -f web/Dockerfile .

test-web:
	docker run -it --rm drupalista/web bash

build-redis:
	docker build -t drupalista/redis -f redis/Dockerfile .
