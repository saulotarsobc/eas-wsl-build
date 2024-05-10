- [✅] [WSL](./wsl/)
- [🏗️] [Docker](./docker/)
- [🏗️] [MAC os](./mac/)

---

Para imitar o processo de build do EAS localmente em sua rede, você pode configurar uma infraestrutura de compilação automatizada em um servidor local ou em uma máquina virtual na sua rede. Aqui está um guia básico para configurar isso:

1. **Configuração do Servidor Local:**
   - Configure um servidor local com recursos adequados para compilar seus projetos. Isso pode ser uma máquina física ou uma máquina virtual (VM) em sua rede local.
   - Instale o sistema operacional adequado para suas necessidades. Muitas vezes, sistemas baseados em Linux são preferidos devido à sua estabilidade e suporte robusto para ferramentas de desenvolvimento.

2. **Instalação de Dependências:**
   - Instale todas as dependências necessárias para compilar seus projetos. Isso pode incluir o Java JDK, Android SDK, Node.js, npm, Gradle e outras ferramentas específicas do seu projeto.
   - Certifique-se de configurar corretamente as variáveis de ambiente, como `ANDROID_HOME`, `JAVA_HOME`, `PATH`, etc., para que as ferramentas de compilação possam ser encontradas pelo sistema.

3. **Configuração do Servidor de Compilação:**
   - Configure um servidor de compilação em seu servidor local. Isso pode ser feito usando ferramentas como Jenkins, GitLab CI, CircleCI ou qualquer outra ferramenta de CI/CD de sua escolha.
   - Configure o servidor de compilação para ouvir a um repositório de controle de versão (como GitLab, GitHub, Bitbucket, etc.) onde seu código-fonte está hospedado.
   - Configure os gatilhos de compilação para acionar uma compilação sempre que ocorrerem mudanças no repositório de código-fonte.

4. **Script de Compilação Personalizado:**
   - Crie um script de compilação personalizado que automatize o processo de compilação do seu projeto. Esse script pode incluir etapas como instalação de dependências, compilação de código, execução de testes, empacotamento de aplicativos, etc.
   - Certifique-se de incluir etapas específicas do seu projeto, como compilar um aplicativo React Native usando `expo build`, `react-native build`, ou qualquer outra ferramenta de compilação relevante para o seu caso.

5. **Integração de Secretos:**
   - Se o seu projeto depender de chaves de API, tokens de acesso ou outras informações sensíveis, certifique-se de gerenciar esses segredos de forma segura. Isso pode envolver o uso de ferramentas de gerenciamento de segredos ou a configuração de variáveis de ambiente protegidas no seu servidor de compilação.

6. **Teste e Iteração:**
   - Teste seu processo de compilação localmente para garantir que tudo esteja configurado corretamente e que os builds estejam sendo executados conforme esperado.
   - Faça iterações e ajustes conforme necessário para otimizar e melhorar o processo de compilação.

Com essa configuração, você poderá compilar seus projetos localmente em sua rede, reduzindo assim os custos associados ao uso de serviços de compilação na nuvem da Expo. No entanto, lembre-se de que manter um servidor de compilação local pode exigir recursos de hardware e manutenção adicionais, portanto, avalie os prós e contras antes de tomar uma decisão.