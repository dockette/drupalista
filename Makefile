DOCKER_WEB_IMAGE?=drupalista/web
DOCKER_REDIS_IMAGE?=drupalista/redis
DOCKER_TAG?=latest
COMPOSE_FILE?=docker-compose.yml

.PHONY: build
build: build-web build-redis

.PHONY: build-web
build-web:
	docker build -t ${DOCKER_WEB_IMAGE}:${DOCKER_TAG} -f web/Dockerfile .

.PHONY: test
test:
	docker compose -f ${COMPOSE_FILE} config
	docker run --rm ${DOCKER_WEB_IMAGE}:${DOCKER_TAG} php -v
	docker run --rm ${DOCKER_REDIS_IMAGE}:${DOCKER_TAG} redis-server --version

.PHONY: test-web
test-web:
	docker run --rm ${DOCKER_WEB_IMAGE}:${DOCKER_TAG} php -v

.PHONY: build-redis
build-redis:
	docker build -t ${DOCKER_REDIS_IMAGE}:${DOCKER_TAG} -f redis/Dockerfile .

.PHONY: test-redis
test-redis:
	docker run --rm ${DOCKER_REDIS_IMAGE}:${DOCKER_TAG} redis-server --version

.PHONY: run
run:
	docker compose -f ${COMPOSE_FILE} up
