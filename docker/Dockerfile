FROM node:18.18.0

# Atualizando e instalando pacotes necessários
RUN apt update && apt upgrade -y && apt install curl unzip zip curl -y;

# Instalando Java e Gradle
RUN apt install openjdk-17-jdk -y;
ENV JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
RUN java --version;

# Instalando Android Command-line Tools
RUN cd ~;
RUN curl https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip?hl=pt-br -o /tmp/cmd-tools.zip;
RUN mkdir -p android/cmdline-tools;
RUN unzip -q -d android/cmdline-tools /tmp/cmd-tools.zip;
RUN mv android/cmdline-tools/cmdline-tools android/cmdline-tools/latest;
RUN rm /tmp/cmd-tools.zip;
ENV ANDROID_HOME="$HOME/android"
ENV ANDROID_SDK_ROOT="$ANDROID_HOME"
ENV PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH"
RUN yes | sdkmanager --licenses;
RUN sdkmanager --update;

# Configurando o Android NDK (Native Development Kit)
RUN cd ~;
RUN curl https://dl.google.com/android/repository/android-ndk-r26d-linux.zip  -o /tmp/ndk.zip;
RUN mkdir -p android/ndk;
RUN unzip -q -d android/ndk /tmp/ndk.zip;
RUN rm /tmp/ndk.zip;
ENV ANDROID_NDK_HOME="$HOME/android/ndk/android-ndk-r26d"

# Instalando EAS CLI (Expo Application Services Command Line Interface)
RUN npm install -g npm@9.8.1 yarn@1.22.19 pnpm@8.9.2 eas-cli@latest sharp-cli node-gyp@10.0.1 bun@1.0.14 --force;

# Copiando o projeto e instalando dependências
COPY . /app
RUN cd app && npm install;

# Rodando build android
## Token do eas
ENV EXPO_TOKEN=#################
## Verificando login no eas
RUN eas whoami;
## Build
WORKDIR /app
# RUN eas build -p android -e production --local;
CMD ["eas", "build", "-p", "android", "-e", "production", "--local"];

# Mantendo o contêiner em execução
# CMD ["tail", "-f", "/dev/null"]