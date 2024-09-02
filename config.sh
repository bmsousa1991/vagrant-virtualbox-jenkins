#!/bin/bash

# Função para verificar se o último comando foi bem-sucedido
check_error() {
  if [ $? -ne 0 ]; then
    echo "Erro detectado! Abortando."
    exit 1
  fi
}

# Atualiza os pacotes do sistema
sudo apt update -y
check_error

# Instala as dependências necessárias para adicionar repositórios
sudo apt install -y wget curl gnupg2 lsb-release ca-certificates
check_error

# Garante que o diretório de keyrings exista
sudo mkdir -p /etc/apt/keyrings
check_error

# Baixa e adiciona a chave GPG do Adoptium
wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | sudo tee /etc/apt/keyrings/adoptium.asc > /dev/null
check_error

# Adiciona o repositório Adoptium, utilizando o codinome correto para o Ubuntu 22.04 (Jammy)
echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb jammy main" | sudo tee /etc/apt/sources.list.d/adoptium.list > /dev/null
check_error

# Atualiza os pacotes do sistema novamente para incluir o novo repositório
sudo apt update -y
check_error

# Instala o JDK 17 do Adoptium
sudo apt install temurin-17-jdk -y
check_error

# Verifica a instalação do Java
/usr/bin/java --version
check_error

# Baixa e adiciona a chave GPG do Jenkins
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
check_error

# Adiciona o repositório do Jenkins à lista de fontes
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
check_error

# Atualiza os pacotes do sistema novamente para incluir o repositório do Jenkins
sudo apt update -y
check_error

# Instala o Jenkins
sudo apt install jenkins -y
check_error

# Inicia o serviço Jenkins
sudo systemctl start jenkins
check_error

# Exibe o status do serviço Jenkins
sudo systemctl status jenkins

# Instala o Docker
sudo apt-get update
sudo apt-get install docker.io -y
check_error

# Adiciona o usuário atual ao grupo Docker
sudo usermod -aG docker $USER
check_error

# Atualiza o grupo para aplicar as mudanças de permissão do Docker
newgrp docker
check_error

# Ajusta permissões para o socket Docker
sudo chmod 777 /var/run/docker.sock
check_error

# Executa o SonarQube em um container Docker
docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
check_error
