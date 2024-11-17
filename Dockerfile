FROM node:22.11.0

WORKDIR /
RUN npm install -g npm@10.3.0 && npm -g i eas-cli @expo/ngrok@^4.1.0 sharp-cli@^2.1.0
RUN apt update && apt install -y wget unzip android-sdk
RUN corepack enable && corepack prepare yarn@stable --activate && yarn set version stable
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip && unzip commandlinetools-linux-9477386_latest.zip
RUN wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip && unzip platform-tools-latest-linux.zip
RUN mkdir -p /android-sdk/cmdline-tools/latest && mv ./cmdline-tools/* ./android-sdk/cmdline-tools/latest
RUN mkdir -p /android-sdk/platform-tools && mv ./platform-tools/* ./android-sdk/platform-tools
ENV PATH /android-sdk/cmdline-tools/latest/bin:$PATH
ENV ANDROID_SDK_ROOT /android-sdk
ENV EAS_NO_VCS 1
RUN yes | sdkmanager --licenses

WORKDIR /project
WORKDIR /project/app
VOLUME ["/project/app"]

CMD ["tail", "-f", "/dev/null"]
