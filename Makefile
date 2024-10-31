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
	docker compose --profile dev watch

down:
	docker compose down

up-xray:
	docker-compose --profile xray up

