
## Run docker image
```
docker run --rm --name ${APP_NAME} \
  v $(CURRENT_DIR)/data:/app/data \
		-v $(APP_CONFIG):/etc/app/config/${APP_NAME}_config.yaml \
		-v $(GOOGLE_APPLICATION_CREDENTIALS):/etc/secrets/google/key.json \
		-e APP_CONFIG=/etc/app/config/${APP_NAME}_config.yaml \
		-e PROJECT_HOME=/app \
		-e GOOGLE_APPLICATION_CREDENTIALS=/etc/secrets/google/key.json \
		-p 0.0.0.0:${DEFAULT_DOCKER_PORT}:8080 \
		${APP_NAME}:local
```

## Stop docker container
```
docker stop ${CONTAINER_NAME} > /dev/null 2>&1 || true
```
