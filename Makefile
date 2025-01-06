# Build the Docker image
build:
    docker-compose build

# Run the Flask application
run:
    docker-compose up web

# Run the tests
test:
    docker-compose run test

# Clean up Docker containers and images
clean:
    docker-compose down --rmi all --volumes --remove-orphans

# Default target to build, run, and test
all: build run test clean