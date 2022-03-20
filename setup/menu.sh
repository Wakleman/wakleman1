#!/bin/bash
#Menu
green='\e[32m'
RED='\033[0;31m'
NC='\033[0m'
BGBLUE='\e[1;44m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
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
tele=$(cat /home/contact)
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	uram=$( free -m | awk 'NR==2 {print $3}' )
	fram=$( free -m | awk 'NR==2 {print $4}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
name=$(curl -sS https://raw.githubusercontent.com/wakleman/ip/main/access | grep $IPVPS | awk '{print $2}')
exp=$(curl -sS https://raw.githubusercontent.com/wakleman/ip/main/access | grep $IPVPS | awk '{print $3}')
clear
echo -e ""
echo -e "$RED ████████╗██████╗░██╗░█████╗░██╗░░██╗░██████╗ $NC"
echo -e "$RED ╚══██╔══╝██╔══██╗██║██╔══██╗██║░██╔╝██╔════╝ $NC"
echo -e "$RED ░░░██║░░░██████╔╝██║██║░░╚═╝█████═╝░╚█████╗░ $NC"
echo -e "$RED ░░░██║░░░██╔══██╗██║██║░░██╗██╔═██╗░░╚═══██╗ $NC"
echo -e "$RED ░░░██║░░░██║░░██║██║╚█████╔╝██║░╚██╗██████╔╝ $NC"
echo -e "$RED ░░░╚═╝░░░╚═╝░░╚═╝╚═╝░╚════╝░╚═╝░░╚═╝╚═════╝░ $NC"
echo -e "$green Premium Script$NC"
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "${BGBLUE}                      SERVER INFORMATION                    ${NC}"
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
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
echo -e "$green Client Name          :$name${NC}"
echo -e "$green Expired Date         :$exp${NC}"
echo -e "$green Provided By          :@anakjati567"$NC
echo -e "$green Script Version       :$Sver"$NC
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "${BGBLUE}                        MAIN MENU                           ${NC}"
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "$green (•1) $NC PANEL SSH & OPENVPN"
echo -e "$green (•2) $NC PANEL L2TP, PPTP, SSTP"
echo -e "$green (•3) $NC PANEL WIREGUARDS"
echo -e "$green (•4) $NC PANEL SS & SSR"
echo -e "$green (•5) $NC PANEL XRAY CORE"
echo -e "$green (•6) $NC PANEL V2RAY CORE"
echo -e "$green (•7) $NC PANEL ALL TRIAL"
echo -e "$green (•8) $NC SYSTEM MENU"
echo -e "$green (•9) $NC CHECK RUNNING SC"
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e " Premium VPS by @anakjati567"
echo -e " Thank you for using script by PAKYAVPN"
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e ""
echo -e "[Ctrl + C] For exit from main menu"
echo -e ""
read -p "Select Menu Options [ 1 - 9 or *] : " menu
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