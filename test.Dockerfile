FROM amazoncorretto:21-alpine3.18

RUN apk update && apk upgrade

RUN apk add postgresql-client mysql-client mariadb-connector-c-dev maven

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline
RUN mvn dependency:resolve

COPY . .

RUN echo "#!/bin/sh" > /app/start.sh
RUN echo "sleep 50" >> /app/start.sh
RUN echo "mvn clean install" >> /app/start.sh

RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]