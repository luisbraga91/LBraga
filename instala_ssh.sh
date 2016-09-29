#!/bin/bash
echo script criado por LUIS FILIPE MATIAS BRAGA





#2) Criar um script chamado instala_ssh.sh que:
#Instale o servidor de SSH "openssh-server";
apt-get install openssh-server #comando para instalar o servidor ssh
# Troque a porta do SSHd para 10000 e reinicie o serviço SSH;
  vim /etc/ssh/sshd_config #alterar ''Port22'' para ''Port 10000''
sudo /etc/init.d/ssh restart #comando para reiniciar o serviço do ssh.
