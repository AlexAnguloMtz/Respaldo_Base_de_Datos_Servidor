FROM amazoncorretto:21-alpine3.18

RUN apk update && apk upgrade

RUN apk add postgresql-client mysql-client mariadb-connector-c-dev

WORKDIR /app

COPY . .

RUN ./mvnw clean install -DskipTests

CMD ["java", "-jar", "./target/backups-0.0.1-SNAPSHOT.jar"]