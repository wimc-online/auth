# Auth for "Where is my courier?"
![Publish Docker image](https://github.com/wimc-online/auth/workflows/Publish%20Docker%20image/badge.svg)

## Development
```shell script
# check if docker is installed
command -v docker
# build docker image
docker build -t docker.pkg.github.com/wimc-online/auth/auth:latest .
# run docker containers
docker run --name auth_db -p 3306:3306 -e MYSQL_DATABASE=auth -e MYSQL_PASSWORD=password -e MYSQL_ROOT_PASSWORD=password -e MYSQL_USER=user --rm -d mysql:5.7
docker run --name auth --link auth_db:auth_db -p 8080:8080 -p 8443:8443 -e DB_ADDR=auth_db -e DB_DATABASE=auth -e DB_PASSWORD=password -e DB_USER=user -e DB_VENDOR=mysql -e KEYCLOAK_PASSWORD=password -e KEYCLOAK_USER=user -e PROXY_ADDRESS_FORWARDING=true --rm -d docker.pkg.github.com/wimc-online/auth/auth:latest
# wait for container to start
docker logs -f auth
```
...
```shell script
# stop container
docker stop auth auth_db
```

## Links
- jboss/keycloak [dockerhub](https://hub.docker.com/r/jboss/keycloak/dockerfile)
