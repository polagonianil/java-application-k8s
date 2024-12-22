# Start with the base OpenJDK image
FROM openjdk:11-jdk-slim

# Add a label to the image
LABEL maintainer="you@example.com"

# Set the working directory
WORKDIR /app

# Copy the packaged jar file into the container
COPY target/demo-1.0-SNAPSHOT.jar demo.jar

# Command to run the jar file
ENTRYPOINT ["java", "-jar", "demo.jar"]
