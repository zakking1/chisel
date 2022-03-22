#!/bin/bash
clear
Menu() {
echo -e "SERVIDOR CHISEL SCRIPT by CRYZUEZIN"
echo -e ""
echo -e "1. VER O IP DA VPS
2. INSTALAR E INICIAR O SERVIDOR CHISEL
3. PAUSAR O CHISEL
4. INICIAR O CHISEL
5. REINICIAR O CHISEL
6. REMOVER COMPLETAMENTE O SERVIDOR CHISEL
7. REMOVER O SERVIDOR CHISEL SCRIPT
0. SAIR DO SERVIDOR CHISEL SCRIPT

ESCOLHA UMA DAS OPCÕES, COM O NUMERO: "

read Op
case $Op in

1) Op1 ;;
2) Op2 ;;
3) Op3 ;;
4) Op4 ;;
5) Op5 ;;
6) Op6 ;;
7) Op7 ;;
0) Sair ;;
esac
}

Op1 () {
clear
apt install curl -y
curl ipv4.icanhazip.com
}

Op2 () {
clear
read -p "ESCOLHA UM FORMATO DO DOCKER, QUE É SUPORTADO POR SUA VPS (docker ou docker.io): " docker && apt update && apt install $docker -y && read -p "EM QUAL PORTA, VOCÊ DESEJAR INSTALAR O SERVIDOR CHISEL? " porta && read -p "DEFINA UM NOME DE USUÁRIO PARA O CHISEL:  " username && read -p "DEFINA UMA SENHA PARA O CHISEL: " password && docker run --name chisel -p $porta:$porta -d --restart always jpillora/chisel server -p $porta --socks5 --key supersecret --auth "$username:$password"
bash chisel.sh
}

Op3 () {
read -p "ESCOLHA UM FORMATO DO DOCKER, QUE É SUPORTADO POR SUA VPS (docker ou docker.io): " docker && $docker stop chisel
bash chisel.sh
}

Op4 () {
read -p "ESCOLHA UM FORMATO DO DOCKER, QUE É SUPORTADO POR SUA VPS (docker ou docker.io): " docker && $docker start chisel
bash chisel.sh
}

Op5 () {
read -p "ESCOLHA UM FORMATO DO DOCKER, QUE É SUPORTADO POR SUA VPS (docker ou docker.io): " docker && $docker restart chisel
bash chisel.sh
}

Op6 () {
read -p "ESCOLHA UM FORMATO DO DOCKER, QUE É SUPORTADO POR SUA VPS (docker ou docker.io): " docker && $docker stop chisel && $docker rm chisel
bash chisel.sh
}

Op7 () {
rm chisel.sh
}

Voltar () {
clear
Menu
}

Sair () {
clear
exit
}
clear
Menu