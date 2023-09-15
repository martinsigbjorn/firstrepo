FROM ubuntu:latest

# ignore user input required
ARG DEBIAN_FRONTEND=noninteractive 

# Install required build dependencies
RUN apt-get -y update && apt-get install -y
RUN apt-get -y install g++ cmake git

COPY . /app

WORKDIR /app

# Run cmake configure & build process
RUN mkdir ./build
RUN cmake -B./build -S . -D CMAKE_BUILD_TYPE=Release
RUN cmake --build ./build

# Launch built application
CMD ["./build/cppdocker_run"]