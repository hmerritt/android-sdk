# Android SDK in Docker

Build Android react-native apps with `android-sdk`.

`eas-cli` is included to build [Expo](https://expo.dev/) apps.

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
