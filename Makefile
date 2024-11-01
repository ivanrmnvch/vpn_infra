# services
DOCKER_COMPOSE = docker-compose

# containers
CONTAINER_XRAY_VPN = xray-vpn
CONTAINER_XRAY_MANAGER = xray-manager

init: init-folders init-default-files git-clone-services init-services

init-folders:
	cd ./scripts && sh init-folders.sh

init-default-files:
	cd ./scripts && sh init-default-files.sh

git-clone-services: ## Клонирование репозиториев
	cd ./scripts && sh git-clone-services.sh

init-services:
	cd repositories/api-gateway/src && npm i
	cd repositories/tg-bot && make init
	cd repositories/xray-manager/src && npm i

dev:
	$(DOCKER_COMPOSE) --profile dev watch

down:
	$(DOCKER_COMPOSE) down

#xray:
#	$(DOCKER_COMPOSE) --profile xray up


run-xray-vpn:
	$(DOCKER_COMPOSE) up -d $(CONTAINER_XRAY_VPN)

get-xray-vpn-log-path:
	@$(eval LOG_PATH := $(shell docker inspect --format='{{.LogPath}}' $(CONTAINER_XRAY_VPN)))
	# @echo "LOG_PATH is now: $(LOG_PATH)"

run-xray-manager: get-xray-vpn-log-path
	LOG_PATH=$(LOG_PATH) $(DOCKER_COMPOSE) up -d --build --force-recreate --remove-orphans --scale $(CONTAINER_XRAY_MANAGER)=1 $(CONTAINER_XRAY_MANAGER)

xray: run-xray-vpn run-xray-manager
