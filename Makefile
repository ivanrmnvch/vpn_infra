up:
	docker compose up -d

down:
	docker stop redis_container && docker compose rm redis

copy-env:
	sh ./scripts/copy-env.sh

