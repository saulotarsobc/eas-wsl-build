- [Home](../)

---

# Configurando EAS num Ambiente WSL

> Este tutorial aborda a configuração de um ambiente de desenvolvimento para aplicativos Android no WSL, incluindo a configuração do Node.js, Java, Gradle, Android NDK, Android Command-line Tools, Bun, EAS CLI e a construção de um projeto React Native localmente. Certifique-se de ajustar as configurações e variáveis de ambiente conforme necessário para o seu ambiente de desenvolvimento.


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
```

```sh
nvm ls;
nvm install v18.18.0;
nvm use v18.18.0
node -v;
npm -v;
```

## Instalando Java
```sh
sudo apt install openjdk-17-jdk -y;
echo -e '\n\n# java' >> ~/.bashrc
echo 'export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"' >> ~/.bashrc;
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
```

```sh
echo -e '\n\n# android' >> ~/.bashrc
echo 'export ANDROID_HOME="$HOME/android"' >> ~/.bashrc
echo 'export ANDROID_SDK_ROOT="$ANDROID_HOME"' >> ~/.bashrc
echo 'export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc;
```

```sh
sdkmanager --version; # test
```

```sh
sdkmanager --list;
```

```sh
yes | sdkmanager --licenses;
```

```sh
sdkmanager --update;
```

## Configurando o Android NDK (Native Development Kit)
```sh
cd ~;
curl https://dl.google.com/android/repository/android-ndk-r26d-linux.zip  -o /tmp/ndk.zip;
mkdir -p android/ndk;
unzip -q -d android/ndk /tmp/ndk.zip;
rm /tmp/ndk.zip;
```

```sh
echo -e '\n\n# ndk' >> ~/.bashrc
echo 'export ANDROID_NDK_HOME="$HOME/android/ndk/android-ndk-r26d"' >> ~/.bashrc
source ~/.bashrc
```

```sh
$ANDROID_NDK_HOME/ndk-build --version; # test
```

## Instalando Bun (Um gerenciador de pacotes universal)
```sh
sudo curl -fsSL https://bun.sh/install | bash -s "bun-v1.1.13";
source ~/.bashrc;
bun -v; # test
```

## Instalando EAS CLI (Expo Application Services Command Line Interface) e outras dependências
```sh
npm install -g npm@9.8.1 yarn@1.22.21 pnpm@9.3.0 eas-cli sharp-cli node-gyp@10.1.0;
```

## Logando do EAS CLI
```sh
eas login;
```

```sh
# > ? Email or username › meuUserName@mail.com
# > ? Password › suSuperSenh@
# > Logged in
```

```sh
eas whoami;
```

## Configurando um projeto React Native

```sh
npx create-expo-app meu-app --template;
cd meu-app;
```

```sh
npm install;
```

```sh
npm start;
```

```sh
eas init;
eas update:configure;
eas build:configure;
```

### O comando a seguir vai usar o `eas.dev`(online) para realizar a `build`. Ele é muito imporante para configurar as Keys do do seu app.

```sh
eas build;
```

### Adicione o perfil `apk` no eas.json no campo `build`. É o que vamos usar para os testes.

```json
...
"apk": {
    "channel": "preview",
    "android": {
        "buildType": "apk"
        }
    }
```

## Variáveis de Ambiente para Construção Local do EAS

```sh
export EAS_LOCAL_BUILD_SKIP_CLEANUP=0
export EAS_LOCAL_BUILD_ARTIFACTS_DIR=$(pwd)/builder/EAS_LOCAL_BUILD_ARTIFACTS_DIR
export EAS_LOCAL_BUILD_WORKINGDIR=$(pwd)/builder/EAS_LOCAL_BUILD_WORKINGDIR
export EAS_BUILD_WORKER_DIR=$(pwd)/builder/EAS_BUILD_WORKER_DIR
```

Essas variáveis de ambiente são usadas em um ambiente de construção local do EAS (Expo Application Services). Aqui está uma explicação de cada uma:

Essas variáveis de ambiente estão sendo definidas com base no diretório atual ($(pwd)) para fornecer caminhos absolutos para diferentes diretórios relacionados à compilação local do EAS (Expo Application Services). Aqui está o significado de cada uma delas:

- `EAS_LOCAL_BUILD_SKIP_CLEANUP=0`: Define se o processo de limpeza será executado após a compilação. Se definido como `0`, o cleanup será executado. Se definido como qualquer outro valor, o cleanup será pulado. Isso pode ser útil para depuração ou para evitar a exclusão de certos arquivos após a compilação.

- `EAS_LOCAL_BUILD_ARTIFACTS_DIR=$(pwd)/builder/EAS_LOCAL_BUILD_ARTIFACTS_DIR`: Especifica o diretório onde os artefatos da compilação serão armazenados. O caminho absoluto é construído concatenando o diretório atual (`$(pwd)`) com o diretório `builder/EAS_LOCAL_BUILD_ARTIFACTS_DIR`.

- `EAS_LOCAL_BUILD_WORKINGDIR=$(pwd)/builder/EAS_LOCAL_BUILD_WORKINGDIR`: Define o diretório de trabalho para o processo de compilação local. Da mesma forma, é construído usando o diretório atual (`$(pwd)`) e o diretório `builder/EAS_LOCAL_BUILD_WORKINGDIR`.

- `EAS_BUILD_WORKER_DIR=$(pwd)/builder/EAS_BUILD_WORKER_DIR`: Especifica o diretório onde os workers (trabalhadores) do EAS Build serão executados. Novamente, é construído usando o diretório atual (`$(pwd)`) e o diretório `builder/EAS_BUILD_WORKER_DIR`.

Usar o `$(pwd)` garante que esses caminhos sejam absolutos e independentes do diretório de onde os comandos são executados. Isso pode ser útil para garantir consistência e evitar problemas relacionados a diretórios relativos.

Essas variáveis são úteis para controlar e personalizar o processo de construção local de aplicativos Expo. Elas podem ser definidas no seu ambiente de desenvolvimento ou em scripts de automação para garantir uma compilação consistente e controlada do aplicativo.



## Comandos EAS Build para Compilação Local de Aplicativos Android

Aqui estão dois comandos `eas build` para compilar aplicativos Android localmente usando o EAS (Expo Application Services):

### Compilação para APK de Desenvolvimento Local

```sh
eas build -p android -e apk --local;
```

#### Patametros

- `-p android`: Novamente, especifica que o aplicativo é destinado à plataforma Android.
- `-e apk`: Indica que a compilação será para um arquivo APK (Android Package) de desenvolvimento.
- `--local`: Como antes, indica que a compilação será executada localmente.

## Extras

- [sdkmanager](./sdkmanager.md)
- [expo --check](./expo-check.md)
