FROM amazoncorretto:21-alpine3.18

RUN apk update && apk upgrade

RUN apk add postgresql-client mysql-client mariadb-connector-c-dev maven

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline
RUN mvn dependency:resolve

COPY . .

RUN mvn clean package -DskipTests

CMD ["java", "-jar", "./target/backups-0.0.1-SNAPSHOT.jar"]