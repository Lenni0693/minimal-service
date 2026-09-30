FROM eclipse-temurin:25-jdk-alpine AS builder

WORKDIR /app
COPY pom.xml .
COPY src ./src
COPY settings.xml .

RUN apk add --no-cache maven && \
    mvn clean package -DskipTests -s settings.xml

FROM eclipse-temurin:25-jre-alpine

WORKDIR /app
COPY --from=builder /app/target/minimal-service-1.0.0.jar app.jar

EXPOSE 8000

ENTRYPOINT ["java", "-jar", "app.jar"]
