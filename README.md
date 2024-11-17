# Android SDK in Docker

Build Android react-native apps with `android-sdk`.

`eas-cli` is included to build [Expo](https://expo.dev/) apps.

> Docker hub image: [`hmerritt/android-sdk`](https://hub.docker.com/r/hmerritt/android-sdk)

## Setup locally

1. Create a `docker-compose.yml` file in your project directory.
2. Run `docker compose up -d` to fetch and run the `hmerritt/android-sdk` Docker image
3. Open a shell within the running container `docker exec -it app-app-build-1 bash`
4. Run your build commands and have fun :)

```
version: '3.1'

services:
  app-build:
    image: hmerritt/android-sdk:latest
    network_mode: "host"
    restart: on-failure
    volumes:
      - ./:/project/app
```

## Build & Release

```
docker build -t hmerritt/android-sdk:latest -t hmerritt/android-sdk:1.3.0 .
```

```
docker push hmerritt/android-sdk
```
