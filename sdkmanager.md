# Configuração do Ambiente de Desenvolvimento para Aplicativos React Native Android

Neste guia, vamos explicar os comandos utilizados para configurar o ambiente de desenvolvimento e compilação de aplicativos React Native para Android.

```sh
npx expo prebuild;
cat android/build.gradle | grep targetSdkVersion;
    > targetSdkVersion = Integer.parseInt(findProperty('android.targetSdkVersion') ?: '33')
cat android/build.gradle | grep buildToolsVersion;
    > buildToolsVersion = findProperty('android.buildToolsVersion') ?: '33.0.0'

sdkmanager "platforms;android-33" "build-tools;33.0.0";
```

## Comandos

### 1. `npx expo prebuild`

O comando `npx expo prebuild` é usado para pré-compilar recursos do aplicativo Expo. Isso pode incluir otimização de imagens, pré-compilação de código JavaScript e outras tarefas de preparação. Essa etapa é útil para reduzir o tempo de compilação e melhorar o desempenho do aplicativo.

### 2. `cat android/build.gradle | grep targetSdkVersion`

Este comando busca no arquivo `android/build.gradle` a definição da versão alvo do SDK do Android (`targetSdkVersion`). A versão alvo define qual versão do Android é considerada como alvo para o seu aplicativo.

### 3. `cat android/build.gradle | grep buildToolsVersion`

Este comando busca no arquivo `android/build.gradle` a definição da versão das ferramentas de compilação do Android (`buildToolsVersion`). Estas ferramentas são essenciais para compilar e empacotar seu aplicativo para Android.

### 4. `sdkmanager "platforms;android-33" "build-tools;33.0.0"`

Este comando é usado para instalar a versão específica do SDK do Android (plataforma e ferramentas de compilação) necessária para compilar seu aplicativo para a versão alvo 33 do Android. Isso é importante para garantir que todas as dependências necessárias estejam instaladas corretamente e que seu aplicativo seja compilado com sucesso.

## Conclusão

Configurar o ambiente de desenvolvimento corretamente é crucial para garantir que seu aplicativo React Native para Android seja construído com sucesso. Utilize os comandos mencionados neste guia para preparar adequadamente seu ambiente de desenvolvimento e evitar problemas de compilação.
