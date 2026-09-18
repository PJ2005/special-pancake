FROM eclipse-temurin:25-jre-jammy
WORKDIR /app
# Copy the compiled JAR file into the container
COPY target/student-app-1.0.0.jar app.jar
# Expose the port the web app runs on
EXPOSE 8081
# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
