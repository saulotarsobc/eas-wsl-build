> https://github.com/expo/fyi/blob/main/eas-build-archive.md

Este texto explica como os projetos são enviados para o EAS Build ao executar o comando `eas build`. Aqui está uma explicação detalhada:

1. **Processo de Upload:**
   Quando você executa `eas build`, o EAS CLI precisa obter o código-fonte do seu projeto da sua máquina de desenvolvimento para um dos nossos trabalhadores de compilação macOS ou Linux. Para fazer isso, o EAS CLI coleta e comprime os arquivos do projeto em um único arquivo e, em seguida, faz o upload desse arquivo para armazenamento em nuvem privado acessível apenas pelo trabalhador de compilação. Por padrão, o EAS CLI produz o arquivo copiando todos os arquivos a partir da raiz do repositório git, com exceção de `.git`, `node_modules` e todos os arquivos correspondidos pelas regras do `.gitignore` (ou `.easignore`, se existir).

2. **Arquivos Incluídos no Arquivo de Arquivamento:**
   O arquivo `.easignore` suporta [os mesmos padrões de caminho dos arquivos `.gitignore`](http://git-scm.com/docs/gitignore), mas só pode estar localizado na raiz do seu repositório git e, se estiver presente, nenhum dos arquivos `.gitignore` existentes será respeitado pelo EAS CLI.

3. **Limitações ao Usar o EAS CLI:**
   Por padrão, ou se você definir a variável de ambiente `EAS_NO_VCS`, o EAS CLI usará seu próprio algoritmo de empacotamento que se aproxima do `git clone --depth 1 ...` e permite que você construa com uma árvore de trabalho git suja. Algumas limitações se aplicam ao usar esta abordagem.

4. **Opção `requireCommit`:**
   Se você definir `{ "cli": { "requireCommit": true } }` no nível raiz do seu `eas.json`, o EAS CLI usará o comando `git clone --depth 1 ...` para criar um clone superficial do seu repositório. Com esta abordagem, o projeto enviado para o EAS Build será exatamente o mesmo que no Git - incluindo informações como a ramificação, o hash do commit, etc.

5. **Como Fazer Upload de Arquivos para o EAS Build se Forem Ignorados pelo Git:**
   Você pode codificar o conteúdo do arquivo com `base64`, salvar essa string como segredos e, em seguida, criar o arquivo em um gancho do EAS Build. Alternativamente, você pode optar por não usar o Git e usar o `.easignore` em vez disso.

6. **Como Optar por Não Usar o Git:**
   O fluxo de trabalho padrão não exige que você confira suas alterações, mas o `git` em si ainda é usado para ler alguns metadados sobre o repositório. Você pode definir a variável de ambiente `EAS_NO_VCS=1` para pular o uso do Git para todos os comandos do EAS CLI e, opcionalmente, `EAS_PROJECT_ROOT` para definir a raiz do seu projeto se for diferente da localização do seu arquivo `eas.json`. Se você quiser usar `.easignore` em vez de `.gitignore` com `EAS_NO_VCS=1`, então você precisa colocá-lo no diretório apontado pela variável de ambiente `EAS_PROJECT_ROOT` (se estiver definido), ou no mesmo diretório que seu `eas.json` caso contrário.