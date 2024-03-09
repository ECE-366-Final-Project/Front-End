FROM ghcr.io/cirruslabs/flutter:latest

# https://medium.com/@codemax120/flutter-web-with-docker-06cee1839adb

# Run flutter doctor
RUN flutter doctor

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/

RUN flutter pub upgrade

EXPOSE 12345/tcp
EXPOSE 12345/udb
ENTRYPOINT flutter run -d web-server --web-port=12345