# Use a base image with a C++ environment
FROM debian:12

# Install g++, make, cmake, git, and libevent libraries
RUN apt-get update && apt-get install -y \
    g++ \
    make \
    cmake 

# Set the working directory for the application
WORKDIR /app

# Copy the source code and the Makefile
COPY . /app

# Build the application
RUN cmake . && make all

# Command to run the executable
CMD ["./microservice"]
