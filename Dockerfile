FROM maven:3.9.9-amazoncorretto-23-alpine AS builder
COPY . .
RUN mvn clean verify

FROM maven:3.9.9-amazoncorretto-23-alpine
COPY --from=builder ./target/my-rest-project-0.0.1-SNAPSHOT.jar .
CMD ["java", "-jar", "my-rest-project-0.0.1-SNAPSHOT.jar"]