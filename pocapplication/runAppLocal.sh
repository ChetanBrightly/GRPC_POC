#!/bin/bash

# Define a function to check the last command's result
check_status() {
  if [ $? -ne 0 ]; then
    echo "An error occurred. Stopping the script."
    exit 1
  fi
}

# Start the build process
echo "Building the Quarkus application..."
./gradlew clean build
check_status

echo "Building Docker images and starting services..."
docker-compose up --build -d
check_status

echo "Services are up and running. Access the application at http://localhost:8080"
