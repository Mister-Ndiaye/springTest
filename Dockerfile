FROM maven:3.8-jdk-11 as builder
WORKDIR /opt/app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY ./src ./src
RUN  mvn clean install -Djar.finalName=api -Dmaven.test.skip=true
# no alpine version for openjdk official imagess
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /opt/app/target/*.jar /app/api.jar
ENTRYPOINT ["java","-Dspring.profiles.active=dev","-jar","/app/api.jar"]

EXPOSE 80