#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
BOLD='\e[1m'
BLINK='\e[5m'
END='\e[0m'
RED_B='\e[1;91m'
GREEN_B='\e[1;92m'
YELLOW_B='\e[1;93m'
BLUE_B='\e[1;94m'
PURPLE_B='\e[1;95m'
CYAN_B='\e[1;96m'
WHITE_B='\e[1;97m'
RESET='\e[0m'

red() { echo -e "${RED_B}${1}${RESET}"; }
green() { echo -e "${GREEN_B}${1}${RESET}"; }
yellow() { echo -e "${YELLOW_B}${1}${RESET}"; }
blue() { echo -e "${BLUE_B}${1}${RESET}"; }
purple() { echo -e "${PURPLE_B}${1}${RESET}"; }
cyan() { echo -e "${CYAN_B}${1}${RESET}"; }
white() { echo -e "${WHITE_B}${1}${RESET}"; }
clear
apt update && apt upgrade -y && apt install curl -y && apt install figlet -y && sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 
clear

if [ -f /etc/issue grep -Eqi "debian" ]; then
echo "Installing Lolcat For Debian OS"
sleep 0.5
apt-get install ruby 
wget https://github.com/busyloop/lolcat/archive/master.zip
unzip master.zip
cd lolcat-master/bin
gem install lolcat
elif cat /etc/issue | grep -Eqi "ubuntu"; then
echo "Installing Lolcat For Ubuntu OS"
sleep 0.5
apt-get install lolcat -y 
fi

echo ''
clear
echo ''
echo -e "$RED         ██████╗░░█████╗░██╗░░██╗██╗░░░██╗░█████╗░ $NC"
echo -e "$RED         ██╔══██╗██╔══██╗██║░██╔╝╚██╗░██╔╝██╔══██╗ $NC"
echo -e "$RED         ██████╔╝███████║█████═╝░░╚████╔╝░███████║ $NC"
echo -e "$RED         ██╔═══╝░██╔══██║██╔═██╗░░░╚██╔╝░░██╔══██║ $NC"
echo -e "$RED         ██║░░░░░██║░░██║██║░╚██╗░░░██║░░░██║░░██║ $NC"
echo -e "$RED         ╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝ $NC"
echo "                                                              "
echo -e "$green                ⚡ PREMIUM SPEED SCRIPT ⚡"$NC
echo ' .......................................................... ' | lolcat
echo -e "$green                  Autoscript By PAKYAVPN"$NC
echo -e "$green                   NEW FULL VERSION 2022 "$NC
echo -e "$green                    CONTACT TELEGRAM"$NC
echo -e "$green                       @anakjati567"$NC
echo '...........................................................' | lolcat
echo ''
echo -e "$green                       Tunggu 5 Saat!"$NC
echo ' .......................................................... ' | lolcat
sleep 5
clear
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
# My Telegram : https://t.me/anakjati567



# Getting
apt install git -y > /dev/null 2>&1
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
########################

BURIQ () {
    curl -sS  https://raw.githubusercontent.com/wakleman/ip/main/access > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f  /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f  /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/wakleman/ip/main/access | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Tahniah! Anda Dibenarkan menggunakan PAKYAVPN..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/wakleman/ip/main/access | awk '{print $4}' | grep $MYIP )
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Anda Tidak Dibenarkan Menggunakan Script ini!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Tahniah! Anda Dibenarkan menggunakan PAKYAVPN..." ]; then
green "Tahniah! Anda Dibenarkan menggunakan PAKYAVPN..."
else
red "Anda Tidak Dibenarkan Menggunakan Script ini!"
rm setup.sh > /dev/null 2>&1
sleep 10
exit 0
fi
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Tahniah! Anda Dibenarkan menggunakan PAKYAVPN..." ]; then
echo -ne
else
red "Expired !"
exit 0
fi
echo '============================================='
echo '          Sila Tunggu sebentar '
echo 'Process Update & Upgrade Sedang Dijalankan '
echo '============================================='
sleep 2
apt update && apt upgrade -y
clear
echo '============================================='
echo '      Process Update&Upgrade Selesai '
echo '============================================='
sleep 2
clear
echo '============================================='
echo '        Process Seterusnya Sila Tunggu '
echo '============================================='
clear
if [ -f "/etc/v2ray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
#Folder
mkdir /etc/v2ray
mkdir /etc/xray
mkdir /var/lib/premium-script;
touch /etc/v2ray/domain
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" >> /etc/v2ray/domain
echo "$host" >> /root/domain
echo "PAKYAVPN(v4)" >> /home/version
clear
#Domain
wget https://raw.githubusercontent.com/wakleman/wakleman1/main/addon/cf.sh
chmod +x cf.sh
./cf.sh

#SSH & OPenVPN
wget https://raw.githubusercontent.com/wakleman/wakleman1/main/setup/ssh-vpn.sh
chmod +x ssh-vpn.sh 
screen -S ssh-vpn ./ssh-vpn.sh

#SSTP
wget https://raw.githubusercontent.com/wakleman/wakleman1/main/setup/sstp.sh
chmod +x sstp.sh
screen -S sstp ./sstp.sh

#ShadowsocksR
wget https://raw.githubusercontent.com/wakleman/wakleman1/main/setup/ssr.sh
chmod +x ssr.sh
screen -S ssr ./ssr.sh

#Shadowsocks
wget https://raw.githubusercontent.com/wakleman/wakleman1/main/setup/sodosok.sh
chmod +x sodosok.sh
screen -S ss ./sodosok.sh

#Wireguards
wget https://raw.githubusercontent.com/wakleman/wakleman1/main/setup/wg.sh
chmod +x wg.sh 
screen -S wg ./wg.sh

#XRay
wget https://raw.githubusercontent.com/wakleman/wakleman1/main/setup/ins-xray.sh
chmod +x ins-xray.sh
screen -S xray ./ins-xray.sh

#V2Ray
wget https://raw.githubusercontent.com/wakleman/wakleman1/main/setup/ins-vt.sh
chmod +x ins-vt.sh
./ins-vt.sh

#L2TP
wget https://raw.githubusercontent.com/wakleman/wakleman1/main/setup/ipsec.sh
chmod +x ipsec.sh
screen -S ipsec ./ipsec.sh

#Backup
wget https://raw.githubusercontent.com/wakleman/wakleman1/main/backup/set-br.sh
chmod +x set-br.sh 
./set-br.sh

# Websocket
wget https://raw.githubusercontent.com/wakleman/wakleman1/main/websocket/ws.sh
chmod +x ws.sh
./ws.sh 

#OHP 
wget https://raw.githubusercontent.com/wakleman/wakleman1/main/setup/ohp.sh
chmod +x ohp.sh
./ohp.sh

#Cert
apt install socat -y
wget https://raw.githubusercontent.com/wakleman/wakleman1/main/addon/cert.sh
chmod +x cert.sh
./cert.sh

#Addon
cd /usr/bin
wget -O port-xws "https://raw.githubusercontent.com/wakleman/wakleman1/main/port/port-xws.sh"
wget -O port-xvl "https://raw.githubusercontent.com/wakleman/wakleman1/main/port/port-xvl.sh"
wget -O port-xtr "https://raw.githubusercontent.com/wakleman/wakleman1/main/port/port-xtr.sh"
wget -O port-xtls "https://raw.githubusercontent.com/wakleman/wakleman1/main/port/port-xtls.sh"
wget -O port-vmess "https://raw.githubusercontent.com/wakleman/wakleman1/main/port/port-vmess.sh"
wget -O port-vless "https://raw.githubusercontent.com/wakleman/wakleman1/main/port/port-vless.sh"
wget -O port-trojan "https://raw.githubusercontent.com/wakleman/wakleman1/main/port/port-trojan.sh"
wget -O cekxtls "https://raw.githubusercontent.com/wakleman/wakleman1/main/cek/cekxray.sh"
wget -O port-grpc "https://raw.githubusercontent.com/wakleman/wakleman1/main/port/port-grpc.sh"
wget -O menu-ssh "https://raw.githubusercontent.com/wakleman/wakleman1/main/menu/menu-ssh.sh"
wget -O menu-accel "https://raw.githubusercontent.com/wakleman/wakleman1/main/menu/menu-accel.sh"
wget -O menu-wg "https://raw.githubusercontent.com/wakleman/wakleman1/main/menu/menu-wg.sh"
wget -O menu-ssr "https://raw.githubusercontent.com/wakleman/wakleman1/main/menu/menu-ssr.sh"
wget -O menu-xray "https://raw.githubusercontent.com/wakleman/wakleman1/main/menu/menu-xray.sh"
wget -O menu-v2ray "https://raw.githubusercontent.com/wakleman/wakleman1/main/menu/menu-v2ray.sh"
wget -O system-menu "https://raw.githubusercontent.com/wakleman/wakleman1/main/menu/system-menu.sh"
wget -O trial-menu "https://raw.githubusercontent.com/wakleman/wakleman1/main/menu/trial-menu.sh"
wget -O trialgrpc "https://raw.githubusercontent.com/wakleman/wakleman1/main/trial/trialgrpc.sh"
wget -O triall2tp "https://raw.githubusercontent.com/wakleman/wakleman1/main/trial/trialgrpc.sh"
wget -O trialpptp  "https://raw.githubusercontent.com/wakleman/wakleman1/main/trial/trialpptp.sh"
wget -O trialsstp "https://raw.githubusercontent.com/wakleman/wakleman1/main/trial/trialsstp.sh"
wget -O trialss "https://raw.githubusercontent.com/wakleman/wakleman1/main/trial/trialss.sh"
wget -O trialssr "https://raw.githubusercontent.com/wakleman/wakleman1/main/trial/trialssr.sh"
wget -O trialtrojan "https://raw.githubusercontent.com/wakleman/wakleman1/main/trial/trialtrojan.sh"
wget -O trialvless "https://raw.githubusercontent.com/wakleman/wakleman1/main/trial/trialvless.sh"
wget -O trialvmess "https://raw.githubusercontent.com/wakleman/wakleman1/main/trial/trialvmess.sh"
wget -O trialxtrojan "https://raw.githubusercontent.com/wakleman/wakleman1/main/trial/trialxtrojan.sh"
wget -O trialxvless "https://raw.githubusercontent.com/wakleman/wakleman1/main/trial/trialxvless.sh"
wget -O trialxvmess "https://raw.githubusercontent.com/wakleman/wakleman1/main/trial/trialxvmess.sh"
wget -O trialxtls "https://raw.githubusercontent.com/wakleman/wakleman1/main/trial/trialxvmess.sh"
wget -O cekservice "https://raw.githubusercontent.com/wakleman/wakleman1/main/addon/cekservice.sh"
chmod +x cekservice
chmod +x trialxtls
chmod +x trialgrpc
chmod +x trial-menu
chmod +x triall2tp
chmod +x trialpptp
chmod +x trialsstp
chmod +x trialss 
chmod +x trialssr
chmod +x trialtrojan
chmod +x trialvless
chmod +x trialvmess
chmod +x trialxtrojan
chmod +x trialxvless
chmod +x trialxvmess
chmod +x menu-ssh
chmod +x menu-accel
chmod +x menu-wg
chmod +x menu-ssr
chmod +x menu-xray
chmod +x menu-v2ray
chmod +x menu-bbt
chmod +x system-menu
chmod +x port-xws
chmod +x port-xvl
chmod +x port-xtr
chmod +x port-xtls
chmod +x port-vmess
chmod +x port-vless
chmod +x port-trojan
chmod +x cekxtls
chmod +x port-grpc
cd
rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-xray.sh
rm -f /root/ins-vt.sh
rm -f /root/ins-trgo.sh
rm -f /etc/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/ohp.sh
rm -f /root/ws.sh
rm -f /root/cf.sh
rm -rf /root/ipvps
rm -f /etc/ip
rm -f /root/tmp
echo "3" > /home/ver
clear
echo " "
echo '============================================='
echo "       Installation has been completed!!"
echo "       Here Below Is The Port Services" | tee -a log-install.txt
echo "============================================" | tee -a log-install.txt
sleep 3
echo " "
echo "=================================-Autoscript Premium-===========================" | tee -a log-install.txt
echo "Port Services > > >" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "SSH Ports" | tee -a log-install.txt
echo "Stunnel 4            : 789 , 777" | tee -a log-install.txt
echo "OPenSSH              : 22" | tee -a log-install.txt
echo "OPenVPN              : 1194 TCP , 2200 UDP , 990 SSL" | tee -a log-install.txt
echo "Dropbear             : 109 , 143" | tee -a log-install.txt
echo "Squid                : 8080 , 3128" | tee -a log-install.txt
echo "Nginx                : 89" | tee -a log-install.txt
echo "Wireguard            : 7070" | tee -a log-install.txt
echo "SSR                  : 1443" | tee -a log-install.txt
echo "SS-OBFS-TLS          : 2443" | tee -a log-install.txt
echo "SS-OBFS-HTTP         : 3443" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "V2Ray Core > > >" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "V2Ray VMess TLS      : 342" | tee -a log-install.txt
echo "V2Ray VMess Non TLS  : 982" | tee -a log-install.txt
echo "V2Ray VLess TLS      : 2083" | tee -a log-install.txt
echo "V2Ray VLess Non TLS  : 8889" | tee -a log-install.txt
echo "V2Ray Trojan TCP     : 2087" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "XRay Core > > >" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "XRay VMess TLS       : 6363" | tee -a log-install.txt
echo "XRay VMess Non TLS   : 6464" | tee -a log-install.txt
echo "XRay VLess TLS       : 6565" | tee -a log-install.txt
echo "XRay VLess Non TLS   : 6666" | tee -a log-install.txt
echo "XRay VLess XTLS      : 756" | tee -a log-install.txt
echo "XRay Trojan          : 8553" | tee -a log-install.txt
echo "XRay VMess GRPC TLS  : 80" | tee -a log-install.txt
echo "XRay VLess GRPC TLS  : 880" | tee -a log-install.txt
echo "XRay TRojan GRPC     : 653" | tee -a log-install.txt
echo "Timezone             : Asia/Kuala_Lumpur" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "Admin Contacs > > >" | tee -a log-install.txt
echo ""
echo "TELEGRAM                 : @anakjati567"  | tee -a log-install.txt
echo "Telegram Channel     : t.me/Trickinternet2022" | tee -a log-install.txt
echo "=====================================================" | tee -a log-install.txt
echo ""
echo "------------------Script Created By PAKYAVPN---------------------" | tee -a log-install.txt

sleep 5
clear
echo '============================================='
echo '      SISTEM AKAN REBOOT SEBENTAR LAGI'
echo '============================================='
echo ""
rm -f /root/setup.sh
rm -f /root/.bash_history
echo " Reboot 15 Sec, Setelah ON type menu"
sleep 15
reboot