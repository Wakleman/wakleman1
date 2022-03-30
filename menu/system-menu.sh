#!/bin/bash
Lred='\e[1;91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
white='\e[1;37m'
green='\e[32m'
RED='\033[0;31m'
NC='\033[0m'
BGBLUE='\e[1;44m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
# ==========================================
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://raw.githubusercontent.com/wakleman/ip/main/access > /root/tmp
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
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
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
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/wakleman/ip/main/access | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
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
PERMISSION

if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
green "Tahniah! Anda Dibenarkan menggunakan PAKYAVPN..."
sleep 1
else
clear
blue        "                   ...              "             
blue        "Anda Tidak Dibenarkan Menggunakan Script ini!    " 
blue        "                   ...                     "      
blue    "Hubungi Saya di Telegram Untuk Mendapatkan Kebenaran!  "   
blue    "                  t.me/anakjati567     "
exit 0
fi
clear
echo -e "${Lred} ══════════════════════════════════════════${NC}"
echo -e " ${BGBLUE}         [ SISTEM MENU ]                  ${NC}"
echo -e "${Lred} ══════════════════════════════════════════${NC}"
echo -e "$PURPLE (•1)$NC $Lyellow Panel Domain$NC"
echo -e "$PURPLE (•2)$NC $Lyellow Change Port Of Some Service"$NC
echo -e "$PURPLE (•3)$NC $Lyellow Autobackup Data VPS"$NC
echo -e "$PURPLE (•4)$NC $Lyellow Backup Data VPS"$NC
echo -e "$PURPLE (•5)$NC $Lyellow Restore Data VPS"$NC
echo -e "$PURPLE (•6)$NC $Lyellow Webmin Menu"$NC
echo -e "$PURPLE (•7)$NC $Lyellow Limit Bandwith Speed Server"$NC
echo -e "$PURPLE (•8)$NC $Lyellow Speedtest Server"$NC
echo -e "$PURPLE (•9)$NC $Lyellow ON/OF Auto Reboot"$NC
echo -e "$PURPLE (10)$NC $Lyellow Install BBR$NC"
echo -e "$PURPLE (11)$NC $Lyellow Banner SSH$NC"
echo -e "$PURPLE (12)$NC $Lyellow Update Script"$NC
echo -e "${Lred} ══════════════════════════════════════════${NC}"
echo -e " ${BGBLUE}         x)   MENU                        ${NC}"
echo -e "${Lred} ══════════════════════════════════════════${NC}"
echo -e ""
read -p "     Select From Options [1-10 or x] :  " menu
case $menu in 
1)
domain-menu
;;
2)
changeport
;;
3)
autobackup
;;
4)
backup
;;
5)
restore
;;
6)
wbmn
;;
7)
limitspeed
;;
8)
speedtest
;;
9)
autoreboot
;;
10)
bbr
;;
11)
nano /etc/issue.net
;;
12)
update
;;
x)
exit
;;
*)
echo "Input The Correct Number !"
;;
esac