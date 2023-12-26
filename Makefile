SHELL = /bin/sh
docker_bin := $(shell command -v docker 2> /dev/null)
docker_compose_bin := $(shell command -v docker-compose 2> /dev/null)

.DEFAULT_GOAL := help

help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo "\n  Allowed for overriding next properties:\n\n\
		Usage example:\n\
	    	make up"

#Инициализация
init: init-folders init-services

init-folders: ## Создание папок для сервисов, выдача прав на изменение
	mkdir -p services \
	&& sudo chown -R $(USER):$(USER) services/ \

#git-clone: ## Клонирование всех зависимых репозиториев и доступы
#	-sh ./scripts/git-clone-services.sh

init-services: ## Установка зависимостей для nest серверов
	cd services/backend/app && npm install
	cd services/frontend/client && npm install

#Запуск
front:  ## Запуск фронта в режиме development
	cd ./services/frontend/client && npm run dev


back:  ## Запуск бека
	cd ./services/backend/app && npm run start:dev

#Сборка
build: ## Сборка docker контейнеров приложения
	$(docker_compose_bin) build

up: build ## Сборка и поднятие docker контейнеров при помощи docker-compose
	$(docker_compose_bin) -f docker-compose$(if $(MODE_COMPOSE),-$(MODE_COMPOSE),).yml --profile all up  --remove-orphans

down: ## Удаление docker контейнеров
	$(docker_compose_bin) down
