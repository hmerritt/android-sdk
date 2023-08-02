FROM node:20.4.0

WORKDIR /
RUN npm -g i eas-cli sharp-cli
RUN apt update && apt install -y wget unzip android-sdk
RUN corepack enable && corepack prepare yarn@stable --activate && yarn set version stable
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip && unzip commandlinetools-linux-9477386_latest.zip
RUN mkdir -p /android-sdk/cmdline-tools/latest && mv ./cmdline-tools/* ./android-sdk/cmdline-tools/latest
ENV PATH /android-sdk/cmdline-tools/latest/bin:$PATH
ENV ANDROID_SDK_ROOT /android-sdk
ENV EAS_NO_VCS 1
RUN yes | sdkmanager --licenses

WORKDIR /project
WORKDIR /project/app
VOLUME ["/project/app"]

CMD ["tail", "-f", "/dev/null"]
