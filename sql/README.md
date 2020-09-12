# SQL

## PostGreSQL

### Preferred Approach: Docker Compose

See `docker-compose.yml` and https://github.com/khezen/compose-postgres

Run `docker compose up -d`

### Old ways
Using Docker and PGAdmin4

```bash
# pulling an image
docker pull dpage/pgadmin4

# run as container
docker run -p $HOST_PORT:80 \
    -e 'PGADMIN_DEFAULT_EMAIL=$ADMIN_EMAIL' \
    -e 'PGADMIN_DEFAULT_PASSWORD=$SECRET' \
    --name pgadmin \
    -d dpage/pgadmin4
```

How to Install: `brew install postgresql`

Setup: follow [this instruction](https://gist.github.com/ibraheem4/ce5ccd3e4d7a65589ce84f2a3b7c23a3).

## SQLite

### Preferred Way: Docker

```bash
docker run -it --rm \
    -p 8080:8080 \
    -v $(pwd)/tmpdb/:/data \
    -e SQLITE_DATABASE=db_hello.db \
    coleifer/sqlite-web
```

<!--## MySQL

How to Install: `brew install mysql`

## GUI Tool

### MacOS

Tool: [SequelPro](http://www.sequelpro.com/)

How to Install: `brew cask install sequel-pro`-->
