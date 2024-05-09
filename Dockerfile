FROM ubuntu:22.04

# Atualizando e instalando pacotes necessários no Ubuntu
RUN apt update && apt upgrade -y
RUN apt install curl unzip zip curl -y

# Configurando o NVM (Node Version Manager)
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
RUN mkdir -p ~/.nvm/
ENV NVM_DIR=~/.nvm



# Mantendo o contêiner em execução
CMD ["tail", "-f", "/dev/null"]