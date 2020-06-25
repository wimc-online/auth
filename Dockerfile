FROM jboss/keycloak:10.0.2

COPY ./wait-for-it.sh /usr/local/bin/wait-for-it

ENTRYPOINT [ "wait-for-it", "-s", "-t", "300", "auth_db:3306", "--", "/opt/jboss/tools/docker-entrypoint.sh" ]
