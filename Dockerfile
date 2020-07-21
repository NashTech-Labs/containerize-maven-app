FROM maven as builder

COPY maven-app /app

WORKDIR /app

RUN mvn package

FROM openjdk:8

COPY --from=builder /app/target/my-app-1.0-SNAPSHOT.jar /app.jar

CMD java -jar /app.jar