> Este tutorial aborda a configuração de um ambiente de desenvolvimento para aplicativos Android no WSL, incluindo a configuração do Node.js, Java, Gradle, Android NDK, Android Command-line Tools, Bun, EAS CLI e a construção de um projeto React Native localmente. Certifique-se de ajustar as configurações e variáveis de ambiente conforme necessário para o seu ambiente de desenvolvimento.

# Configurando um Ambiente WSL

## Instalando o Ubuntu no WSL (Windows Subsystem for Linux)
```sh
wsl --install Ubuntu-22.04;
```

## Atualizando e instalando pacotes necessários no Ubuntu
```sh
sudo apt update;
sudo apt upgrade -y;
sudo apt install curl unzip zip curl -y;
```

## Configurando o NVM (Node Version Manager)
```sh
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash;
sudo mkdir ~/.nvm/;
export NVM_DIR=~/.nvm;
source ~/.bashrc;

nvm ls;
nvm install 20 --lts;
node -v;
npm -v;
```

## Instalando Java e Gradle
```sh
sudo apt install openjdk-17-jdk -y;
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64;
source ~/.bashrc;
java --version;
```



## Instalando Android Command-line Tools
```sh
cd ~;
curl https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip?hl=pt-br -o /tmp/cmd-tools.zip;
mkdir -p android/cmdline-tools;
unzip -q -d android/cmdline-tools /tmp/cmd-tools.zip;
mv android/cmdline-tools/cmdline-tools android/cmdline-tools/latest;
rm /tmp/cmd-tools.zip;

export ANDROID_HOME=$HOME/android
export ANDROID_SDK_ROOT=${ANDROID_HOME}
export PATH=${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${PATH}
source ~/.bashrc;

sdkmanager --version; # test
sdkmanager --list;
yes | sdkmanager --licenses;

sdkmanager --update;
```

## Configurando o Android NDK (Native Development Kit)
```sh
cd ~;
curl https://dl.google.com/android/repository/android-ndk-r26d-linux.zip  -o /tmp/ndk.zip;
mkdir -p android/ndk;
unzip -q -d android/ndk /tmp/ndk.zip;
rm /tmp/ndk.zip;
export ANDROID_NDK_HOME="$HOME/android/ndk/android-ndk-r26d" # pode add no .bashrc > nano ~/.bashrc
source ~/.bashrc
$ANDROID_NDK_HOME/ndk-build --version; # test
```

## Instalando Bun (Um gerenciador de pacotes universal)
```sh
sudo curl -fsSL https://bun.sh/install | bash # for macOS, Linux, and WSL
source ~/.bashrc;
bun -v; # test
```

## Instalando EAS CLI (Expo Application Services Command Line Interface)
```sh
npm install -g npm eas-cli sharp-cli node-gyp;
eas login;
    # > ? Email or username › meuUserName@mail.com
    # > ? Password › suAsuperSenh@
    # > Logged in
eas whoami
```

## Configurando um projeto React Native
```sh
npx create-expo-app meu-app --template;
cd meu-app;
npm install; # se precisar
npx expo install expo-updates;
npm start; # para verificar se está tudo funcionando
eas init;
eas update:configure;
eas build:configure;
```
> Adicione o perfil `apk` no eas.json no campo `build`. É o que vamos usar para os testes.

```json
...
"apk": {
    "channel": "preview",
      "android": {
        "buildType": "apk"
    }
}
...
```

## Realizando a construção local

> Antes do comando configure as variáveis de ambiente a seguir.

```sh
export EAS_LOCAL_BUILD_SKIP_CLEANUP=0
export EAS_LOCAL_BUILD_ARTIFACTS_DIR=$(pwd)/builder/EAS_LOCAL_BUILD_ARTIFACTS_DIR
export EAS_LOCAL_BUILD_WORKINGDIR=$(pwd)/builder/EAS_LOCAL_BUILD_WORKINGDIR
export EAS_BUILD_WORKER_DIR=$(pwd)/builder/EAS_BUILD_WORKER_DIR

# build...
eas build -p android -e apk --local;
eas build -p android -e production --local;
```

## Extras

- [sdkmanager](./sdkmanager.md)