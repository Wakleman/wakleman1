#!/bin/bash
#Menu
Lred='\e[1;91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
white='\e[1;37m'
green='\e[32m'
RED='\033[0;31m'
NC='\033[0m'
BGWHITE='\e[0;47;30m'
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
# VPS Information
Checkstart1=$(ip route | grep default | cut -d ' ' -f 3 | head -n 1);
if [[ $Checkstart1 == "venet0" ]]; then
    clear
	  lan_net="venet0"
    typevps="OpenVZ"
    sleep 1
else
    clear
		lan_net="eth0"
    typevps="premium"
    sleep 1
fi
clear
# DNS Patch
tipeos2=$(uname -m)
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
download=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev  | awk '{print $2}' | paste -sd+ - | bc`
downloadsize=$(($download/1073741824))
# Upload
upload=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev | awk '{print $10}' | paste -sd+ - | bc`
uploadsize=$(($upload/1073741824))
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
# Shell Version
shellversion=""
shellversion=Bash
shellversion+=" Version" 
shellversion+=" ${BASH_VERSION/-*}" 
versibash=$shellversion
# Getting OS Information
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
domain=$(cat /etc/v2ray/domain)
Sver=$(cat /home/version)
banner=$(cat /var/lib/banner-name/banner)
ASCII=$(cat /var/lib/banner-name/ASCII)
username=$(cat /var/lib/banner-name/username)
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	uram=$( free -m | awk 'NR==2 {print $3}' )
	fram=$( free -m | awk 'NR==2 {print $4}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
name=$(curl -sS https://raw.githubusercontent.com/wakleman/ip/main/access | grep $IPVPS | awk '{print $2}')
exp=$(curl -sS https://raw.githubusercontent.com/wakleman/ip/main/access | grep $IPVPS | awk '{print $3}')
modifyTime1=$(date +%s -d "${exp}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
remain=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	remain="expired"
fi
clear
echo -e ""
echo -e "$RED ████████╗██████╗░██╗░█████╗░██╗░░██╗░██████╗ $NC"
echo -e "$RED ╚══██╔══╝██╔══██╗██║██╔══██╗██║░██╔╝██╔════╝ $NC"
echo -e "$RED ░░░██║░░░██████╔╝██║██║░░╚═╝█████═╝░╚█████╗░ $NC"
echo -e "$RED ░░░██║░░░██╔══██╗██║██║░░██╗██╔═██╗░░╚═══██╗ $NC"
echo -e "$RED ░░░██║░░░██║░░██║██║╚█████╔╝██║░╚██╗██████╔╝ $NC"
echo -e "$RED ░░░╚═╝░░░╚═╝░░╚═╝╚═╝░╚════╝░╚═╝░░╚═╝╚═════╝░ $NC"
echo -e "$green Premium Script$NC"
echo -e "${Lred}════════════════════════════════════════════════════════════${NC}"
echo -e "${BGWHITE}                      [ SERVER INFORMATION ]                ${NC}"
echo -e "${Lred}════════════════════════════════════════════════════════════${NC}"
echo -e "$green VPS Type             :$typevps"$NC
echo -e "$green CPU Model            :$cname"$NC
echo -e "$green CPU Frequency        :$freq MHz"$NC
echo -e "$green Number Of Cores      :$cores"$NC
echo -e "$green CPU Usage            :$cpu_usage"$NC
echo -e "$green Operating System     :"`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`$NC
echo -e "$green Kernel               :`uname -r`"$NC
echo -e "$green Bash Ver             :$versibash"$NC
echo -e "$green Total Amount Of RAM  :$tram MB"$NC
echo -e "$green Used RAM             :$uram MB"$NC
echo -e "$green Free RAM             :$fram MB"$NC
echo -e "$green System Uptime        :$uptime $DF( From VPS Booting )"$NC
echo -e "$green Download             :$downloadsize GB ( From Startup / VPS Booting )"$NC
echo -e "$green Upload               :$uploadsize GB ( From Startup / VPS Booting )"$NC
echo -e "$green ISP NAME             :$ISP"$NC
echo -e "$green IP VPS               :$IPVPS"$NC
echo -e "$green DOMAIN               :$domain"$NC
echo -e "$green City                 :$CITY"$NC
echo -e "$green SERVER               :$ISP"$NC
echo -e "$green Username             :$username $NC"
echo -e "$green Client Name          :$name"$NC
echo -e "$green Expired On           :$exp"$NC
echo -e "$green Expired In           :$remain Days"$NC
echo -e "$green Script Version       :$Sver"$NC
echo -e "${Lred}════════════════════════════════════════════════════════════${NC}"
echo -e "${BGWHITE}                        [ MAIN MENU ]                       ${NC}"
echo -e "${Lred}════════════════════════════════════════════════════════════${NC}"
echo -e "$PURPLE (•1) $NC $green PANEL SSH & OPENVPN"$NC
echo -e "$PURPLE (•2) $NC $green PANEL L2TP, PPTP, SSTP"$NC
echo -e "$PURPLE (•3) $NC $green PANEL WIREGUARDS"$NC
echo -e "$PURPLE (•4) $NC $green PANEL SS & SSR "$NC
echo -e "$PURPLE (•5) $NC $green PANEL XRAY CORE "$NC
echo -e "$PURPLE (•6) $NC $green PANEL V2RAY CORE "$NC
echo -e "$PURPLE (•7) $NC $green ALL TRIAL"$NC
echo -e "$PURPLE (•8) $NC $green SYSTEM MENU"$NC
echo -e "$PURPLE (•9) $NC $green MENU THEMES"$NC
echo -e "$PURPLE (10) $NC $green REBOOT VPS"$NC
echo -e "$PURPLE (11) $NC $green CHECK RUNNING SC"$NC
echo -e "${Lred}════════════════════════════════════════════════════════════${NC}"
echo -e "$Lyellow Premium VPS by @Jievpn"$NC
echo -e "$Lyellow Thank you for using script by PAKYAVPN"$NC
echo -e "${Lred}════════════════════════════════════════════════════════════${NC}"
echo -e ""
echo -e "$green[Ctrl + C] For exit from main menu"
echo -e ""
read -p "Select Menu Options [1-11 or x] : " menu
case $menu in
1)
menu-ssh
;;
2)
menu-accel
;;
3)
menu-wg
;;
4)
menu-ssr
;;
5)
menu-xray
;;
6)
menu-v2ray
;;
7)
trial-menu
;;
8)
system-menu
;;
9)
menu-change
;;
10)
reboot
;;
11)
cekservice
;;
x)
clear
exit
;;
*)
echo "Please Input Number !"
sleep 2
menu
;;
esac
