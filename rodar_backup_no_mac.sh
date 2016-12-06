#!/bin/bash
clear
LOCAL=/Users
SRVBACKUP=root@backup:/home/samba/dock_station_users
#SRVBACKUP=root@irene:/home/samba/BACKUP/temporario
C_SSH=ssh root@backup du -sh /home/samba/dock_station_users
clear
echo " "
echo " "
echo "1 - Backup da maquina para o servidor "
echo "2 - Backup do servidor para a máquina "
echo "3 - Sair "
echo -ne "\n:"
read op

case $op in

"1")
	echo " "
	echo " Script para backup de usuarios de  macbook para o servidor de backup "
	echo " Para sair digite CTRL+C "
	echo " "
	echo " "
	echo " Digite o nome do usuário ( nome.sobrenome ) "
	read nomeuser
	sudo chmod -R 777 $LOCAL/$nomeuser
	sudo rm -rf $LOCAL/$nomeuser/.Trash
	echo " Senha do servidor de arquivos: "
	sudo rsync -Cravztp --progress  $LOCAL/$nomeuser $SRVBACKUP/backup_$nomeuser/
	
	TAMMAC=` du -sh $LOCAL/$nomeuser `  
	echo " "
	echo " "
	echo " A cópia terminou, agora vamos comparar o tamanho do backup, com a origem "
	echo " "
	echo " "
	echo " Senha do servidor de arquivos: "
	TAMBKP=` ssh root@backup du -sh /home/samba/dock_station_users/backup_$nomeuser `
#	TAMBKP=` ssh root@irene du -sh /home/samba/BACKUP/temporario/backup_$nomeuser `
	echo " "
	echo " "
	echo " O tamanho total de arquivos de $nomeuser é de $TAMMAC "
	echo " "
	echo " O tamanho total de arquivos no Servidor é de $TAMBKP "
	echo " "
	echo " "
	echo " Caso o tamanho seja diferente rode o script novamente! "
;;

"2")
	echo " "
	echo " "
	echo " Backup do servidor para a maquina "
	echo " Ja foi feito o login do usuario??????"
	echo " "
	echo " Digite o nome do usuario (nome.sobrenome) "
	read nomeuser
	sudo chmod -R 777 $LOCAL/$nomeuser
	echo " Senha do servidor de arquivos "
	sudo rsync -Cravztp $SRVBACKUP/backup_$nomeuser/ $LOCAL/

	TAMMAC=` du -sh $LOCAL/$nomeuser `
	echo " "
	echo " "	
	echo " A cópia terminou, agora vamos comparar o tamanho do backup, com a origem "
	echo " "
	echo " "
	echo " Senha do servidor de arquivos: "
	TAMBKP=` ssh root@backup du -sh /home/samba/dock_station_users/backup_$nomeuser `
#        TAMBKP=` ssh root@irene du -sh /home/samba/BACKUP/temporario/backup_$nomeuser `
	echo " "
	echo " "
	echo " O tamanho total de arquivos de $nomeuser é de $TAMMAC "
	echo " "
	echo " O tamanho total de arquivos no Servidor é de $TAMBKP "
	echo " "
	echo " "
	echo " Caso o tamanho seja diferente rode o script novamente! "

;;

"3")
	echo " Saindo"; sleep 1; clear;
 ;;
esac 


