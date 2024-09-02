# Projeto Jenkins e SonarQube com Vagrant e VirtualBox

Este projeto cria um ambiente DevOps local completo com Jenkins e SonarQube, utilizando Vagrant e VirtualBox. Ele proporciona uma alternativa eficiente e de baixo custo ao uso de infraestrutura em nuvem, como AWS, ao executar Jenkins e SonarQube em uma máquina virtual (VM) localmente, reduzindo custos e complexidade.

Com a automação fornecida pelo Vagrant, uma VM baseada em Ubuntu 22.04 é provisionada, configurada com Jenkins e Docker, e executa um container com SonarQube para análise de código. Esse ambiente permite a criação e teste de pipelines CI/CD com integração de qualidade de código, sem a necessidade de investir em serviços de nuvem como instâncias EC2.

Este projeto é ideal para desenvolvedores que buscam simular ambientes de produção e configurar pipelines de CI/CD localmente, economizando recursos financeiros, mas mantendo práticas DevOps robustas e automatizadas.

## Pré-requisitos

- **VirtualBox** instalado e configurado.
- **Vagrant** instalado.

## Como iniciar o projeto

1. Clone o repositório para o seu ambiente local:
    ```bash
    git clone https://github.com/bmsousa1991/vagrant-virtualbox-jenkins.git
    ```

2. No diretório raiz do projeto, execute o comando para criar a VM:
    ```bash
    vagrant up --provider virtualbox
    ```

## Principais Arquivos

- **Vagrantfile:** Define a configuração da VM no VirtualBox, com todas as especificações necessárias.
- **config.sh:** Script que:
  - Atualiza os pacotes do sistema.
  - Instala o Jenkins.
  - Instala o Docker.
  - Configura e inicia um container com SonarQube.

## Funcionalidades

- **Jenkins:** Ferramenta de automação de CI/CD instalada e pronta para uso.
- **SonarQube:** Ferramenta de análise de código configurada automaticamente em um container Docker.

Este projeto automatiza a criação de um ambiente DevOps funcional, facilitando a implementação de pipelines de CI/CD e a análise de qualidade de código de maneira simples e eficiente.
