# AGENTS.md

## Project

Dockette Drupalista is a legacy Dockerized Drupal stack. It builds two local images, `drupalista/web:latest` and `drupalista/redis:latest`, and runs them with PostgreSQL and Adminer through Docker Compose.

## Images

- Web image: `drupalista/web:latest` from `web/Dockerfile`.
- Redis image: `drupalista/redis:latest` from `redis/Dockerfile`.
- The web image is based on `thecodingmachine/php:7.4-v3-slim-apache`; treat PHP 7.4 and the listed extensions as legacy constraints.
- The Redis image is based on `redis:5` and adds `redis/redis.conf` for the Unix socket setup used by the Drupal stack.

## Commands

- `make build` builds both local images.
- `make test` validates the compose file and runs non-interactive PHP/Redis version smoke checks against the built images.
- `make run` starts the compose stack locally.
- `make -n build test run` dry-runs the command wiring without requiring Docker.

## Testing Notes

- Run `docker compose config` after compose changes.
- Run `make test` after Dockerfile, Makefile, or compose changes when Docker is available.
- The smoke tests expect `make build` to have built the local images first.

## Guidelines

- Keep the legacy Drupal constraints documented; do not modernize PHP, Redis, PostgreSQL, or image names unless the task explicitly requires it.
- Prefer `DOCKER_*` Makefile variable names for Docker images and clear direct names for compose variables.
- Place `.PHONY: <target>` directly above every Makefile target.
- Do not add Slack badges.
- Avoid publishing a `dockette/drupalista` image unless the repository is changed to build that image intentionally.
