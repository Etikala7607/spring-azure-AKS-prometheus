FROM lolhens/baseimage-openjre

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from your project directory into the container at /app
COPY Docker-my-version/springbootApp.jar /app/

# Expose the port your application runs on
EXPOSE 80

# Specify the command to run on container start
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
