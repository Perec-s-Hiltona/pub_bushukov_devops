# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Update the package list and install Maven
RUN apt-get update && apt-get install -y maven

# Verify Maven installation
RUN mvn --version

# Set the working directory to /app
WORKDIR /app

# Copy the pom.xml file first to leverage Docker cache
COPY pom.xml .

# Copy the project source code into the container
COPY src ./src

# Build the application using Maven
RUN mvn clean package -DskipTests

# Copy the packaged JAR file into the container
COPY target/*.jar app.jar

# Expose the port that the Spring Boot application runs on
EXPOSE 8080

# Define the command to run the application
CMD ["java", "-jar", "app.jar"]
