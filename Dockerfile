FROM openjdk:17-jdk-slim AS build

COPY pom.xml mvnw ./
RUN chmod +x ./mvnw dependency:resolve

COPY src src
RUN ./mvnw package

FROM openjdk:17-jdk-slim
WORKDIR demo
COPY --from=build target/*.jar demo.jar
ENTRYPOINT ["java", "-jar", "demo.jar"]
