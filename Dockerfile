# First Stage: Build Spring Boot Project
FROM maven:3.9.3-ibmjava-8 as builder

WORKDIR /app

COPY . .

RUN mvn clean package

# Second Stage: Create Lightweight Image with JRE
FROM openjdk:8-jre-alpine

WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=builder /app/target/springbootApp.jar .

EXPOSE 8080

# Specify the command to run on container start
CMD ["java", "-jar", "springbootApp.jar"]
