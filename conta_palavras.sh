#!/bin/bash TRABALHO CRIADO POR LUIS FILIPE MATIAS BRAGA

#3) Criar um script chamado conta_palavras.sh que:
#• Conta as palavras de um texto (video do youtube https://www.youtube.com/watch?
#v=BYYyt6Ag3Kc);



ls $1 > /tmp/arq
CONTA=`cat /tmp/arq | wc -m`
RESULT=$(($CONTA - 1));
sleep 1
echo "O arquivo $1 contem $RESULT caracteres em seu nome!"