# [Docker](https://www.docker.com/)

## Installations

`brew install docker docker-compose docker-machine`

## Run docker image

```bash
docker run --rm --name ${APP_NAME} \
	-v $(CURRENT_DIR)/data:/app/data \
	-v $(APP_CONFIG):/etc/app/config/${APP_NAME}_config.yaml \
	-v $(GOOGLE_APPLICATION_CREDENTIALS):/etc/secrets/google/key.json \
	-e APP_CONFIG=/etc/app/config/${APP_NAME}_config.yaml \
	-e PROJECT_HOME=/app \
	-e GOOGLE_APPLICATION_CREDENTIALS=/etc/secrets/google/key.json \
	-p 0.0.0.0:${DEFAULT_DOCKER_PORT}:8080 \
	${APP_NAME}:local
```

## Stop docker container

```bash
docker stop ${CONTAINER_NAME} > /dev/null 2>&1 || true
```

## Clean Images

https://docs.docker.com/config/pruning/#prune-everything

```
docker images -f dangling=true
docker system prune -a
```