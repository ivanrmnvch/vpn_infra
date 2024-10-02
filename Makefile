up:
	docker compose up -d

down:
	docker compose stop redis_container && docker compose rm redis_container

copy-env:
	sh ./scripts/copy-env.sh

