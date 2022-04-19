DOCKER_COMPOSE_DIR=./docker
DEFAULT_GOAL := help

help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-27s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: docker-prune
docker-prune: ## Удаляет неиспользуемые ресурсы докера с помощью 'docker system prune -a -f --volumes'
	docker system prune -a -f --volumes

.PHONY: docker-up
docker-up: ## Запускает все Docker-контейнеры в фоновом режиме
	docker-compose up -d --build

.PHONY: docker-down
docker-down: ## Останавливает контейнеры и удаляет их
	docker-compose down

.PHONY: docker-down-volume
docker-down-volume: ## Останавливает контейнеры, удаляет контенеры и ТОМА!!!
	docker-compose down -v

.PHONY: docker-build-from-scratch
docker-build-from-scratch: ## Собирает все образы докера с нуля, без кеша
	docker-compose rm -fs && \
	docker-compose build --pull --no-cache --parallel && \
	docker-compose up -d --force-recreate

.PHONY: docker-build
docker-build: ## Собирает все образы докера
	docker-compose build --parallel && \
	docker-compose up -d --force-recreate

.PHONY: yarn-install
yarn-install: ## Устанавливает зависимости yarn
	docker exec -it vue3_course_nodejs bash -c 'cd /home/node/app && yarn install'

.PHONY: console
console: ## Запускает bash на контейнере nodejs (для запуска консольных команд)
	docker exec -it vue3_course_nodejs bash -c 'cd /home/node/app && bash'