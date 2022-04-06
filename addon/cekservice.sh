#!/bin/bash
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
clear
#servicesshow
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
stunnel4_service=$(/etc/init.d/stunnel4 status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
squid_service=$(/etc/init.d/squid status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
v2ray_service=$(systemctl status v2ray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
v2rayn_service=$(systemctl status v2ray@none | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_service=$(systemctl status v2ray@vless | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vlessn_service=$(systemctl status v2ray@vnone | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trojan_service=$(systemctl status trojan | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(/etc/init.d/nginx status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xtls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ohp_service=$(systemctl status ssh-ohp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
openvpn_service=$(systemctl status openvpn | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
webmin_service=$(netstat -ntlp | grep 10000 | awk '{print $7}' | cut -d'/' -f2)
wg_service=$(systemctl status wg-quick@wg0 | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xvtls=$(systemctl status xr-vm-tls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xvntls=$(systemctl status xr-vm-ntls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xvlt=$(systemctl status xr-vl-tls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xvln=$(systemctl status xr-vl-ntls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vmgrpc=$(systemctl status vmess-grpc | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vlgrpc=$(systemctl status vless-grpc | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trgrpc=$(systemctl status trojan-grpc | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xtr=$(systemctl status x-tr | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
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
    typevps="KVM"
    sleep 1
fi
# Ram Usage
total_r2am=` grep "MemAvailable: " /proc/meminfo | awk '{ print $2}'`
MEMORY=$(($total_r2am/1024))
# VPS ISP INFORMATION
ITAM='\033[0;30m'
echo -e "$ITAM"
NAMAISP=$( curl -s ipinfo.io/org | cut -d " " -f 2-10  )
REGION=$( curl -s ipinfo.io/region )
# clear
COUNTRY=$( curl -s ipinfo.io/country )
# clear
WAKTU=$( curl -s ipinfo.ip/timezone )
# clear
CITY=$( curl -s ipinfo.io/city )
# clear
REGION=$( curl -s ipinfo.io/region )
# clear
WAKTUE=$( curl -s ipinfo.io/timezone )
# clear
koordinat=$( curl -s ipinfo.io/loc )
# clear
MYIP=$(wget -qO- ipinfo.io/ip)
# clear
NC='\033[0m'
echo -e "$NC"
# Download
download=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev  | awk '{print $2}' | paste -sd+ - | bc`
downloadsize=$(($download/1073741824))

# Upload
upload=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev | awk '{print $10}' | paste -sd+ - | bc`
uploadsize=$(($upload/1073741824))

# Total Ram
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))

# Tipe Processor
totalcore="$(grep -c "^processor" /proc/cpuinfo)" 
totalcore+=" Core"
corediilik="$(grep -c "^processor" /proc/cpuinfo)" 
tipeprosesor="$(awk -F ': | @' '/model name|Processor|^cpu model|chip type|^cpu type/ {
                        printf $2;
                        exit
                        }' /proc/cpuinfo)"

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

# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Kernel Terbaru
kernelku=$(uname -r)

# Waktu Sekarang 
harini=`date -d "0 days" +"%d-%m-%Y"`
jam=`date -d "0 days" +"%X"`

# DNS Patch
tipeos2=$(uname -m)

# Getting Domain Name
Domen="$(cat /etc/v2ray/domain)"
# Echoing Result
echo -e ""
echo -e "In Here Is Your VPS Information :"
echo -e "SCRIPT VPS BY PAKYAVPN"
echo "-------------------------------------------------------------------------------"
echo "Operating System Information :"
echo -e "VPS Type    : $typevps"
echo -e "OS Arch     : $tipeos2"
echo -e "Hostname    : $HOSTNAME"
echo -e "OS Name     : $Tipe"
echo -e "OS Version  : $Versi_OS"
echo -e "OS URL      : $URL_SUPPORT"
echo -e "OS BASE     : $basedong"
echo -e "OS TYPE     : Linux / Unix"
echo -e "Bash Ver    : $versibash"
echo -e "Kernel Ver  : $kernelku"
echo "-------------------------------------------------------------------------------"
echo "Hardware Information :"
echo -e "Processor   : $tipeprosesor"
echo -e "Proc Core   : $totalcore"
echo -e "Virtual     : $typevps"
echo -e "Cpu Usage   : $cpu_usage"
echo "-------------------------------------------------------------------------------"
echo "System Status / System Information :"
echo -e "Uptime      : $uptime ( From VPS Booting )"
echo -e "Total RAM   : ${totalram}MB"
echo "-------------------------------------------------------------------------------"
echo "Internet Service Provider Information :"
echo -e "Public IP   : $MYIP"
echo -e "Domain      : $Domen"
echo -e "ISP Name    : $NAMAISP"
echo -e "Region      : $REGION "
echo -e "Country     : $COUNTRY"
echo -e "City        : $CITY "
echo -e "Time Zone   : $WAKTUE"
echo "-------------------------------------------------------------------------------"
echo "Time & Date & Location & Coordinate Information :"
echo -e "Location    : $COUNTRY"
echo -e "Coordinate  : $koordinat"
echo -e "Time Zone   : $WAKTUE"
echo -e "Date        : $harini"
echo -e "Time        : $jam ( WIB )"
echo "-------------------------------------------------------------------------------"
echo -e ""

if [[ $fail2ban_service == "running" ]]; then
   status_fail2ban="${GREEN}Running ✔ ${NC}"
else
   status_fail2ban="${RED}Not Running ✖${NC} "
fi

if [[ $ssh_service == "running" ]]; then 
   status_ssh="${GREEN}Running ✔ ${NC}"
else
   status_ssh="${RED}Not Running ✖${NC}"
fi 

if [[ $dropbear_service == "running" ]]; then 
   status_dropbear="${GREEN}Running ✔ ${NC}"
else
   status_dropbear="${RED}Not Running ✖${NC}"
fi 

if [[ $stunnel4_service == "running" ]]; then 
   status_stunnel4="${GREEN}Running ✔ ${NC}"
else
   status_stunnel4="${RED}Not Running ✖${NC}"
fi 

if [[ $squid_service == "running" ]]; then 
   status_squid="${GREEN}Running ✔ ${NC}"
else
   status_squid="${RED}Not Running ✖${NC}"
fi 

if [[ $v2ray_service == "running" ]]; then 
   status_v2ray="${GREEN}Running ✔ ${NC}"
else
   status_v2ray="${RED}Not Running ✖${NC}"
fi 

if [[ $v2rayn_service == "running" ]]; then 
   status_v2rayn="${GREEN}Running ✔ ${NC}"
else
   status_v2rayn="${RED}Not Running ✖${NC}"
fi 

if [[ $vless_service == "running" ]]; then 
   status_vless="${GREEN}Running ✔ ${NC}"
else
   status_vless="${RED}Not Running ✖${NC}"
fi 

if [[ $vlessn_service == "running" ]]; then 
   status_vlessn="${GREEN}Running ✔ ${NC}"
else
   status_vlessn="${RED}Not Running ✖${NC}"
fi 

if [[ $trojan_service == "running" ]]; then 
   status_trojan="${GREEN}Running ✔${NC}"
else
   status_trojan="${RED}Not Running ✖${NC}"
fi 

if [[ $xtr == "running" ]]; then 
   status_xtr="${GREEN}Running ✔${NC}"
else
   status_xtr="${RED}Not Running ✖${NC}"
fi 

if [[ $xray_service == "running" ]]; then 
   status_xray="${GREEN}Running ✔${NC}"
else
   status_xray="${RED}Not Running ✖${NC}"
fi

if [[ $xvtls == "running" ]]; then 
   sts_xvm="${GREEN}Running ✔${NC}"
else
   sts_xvm="${RED}Running ✖${NC}"
fi

if [[ $xvntls == "running" ]]; then 
   sts_xvmn="${GREEN}Running ✔${NC}"
else
   sts_xvmn="${RED}Running ✖${NC}"
fi

if [[ $xvlt == "running" ]]; then 
   sts_xtl="${GREEN}Running ✔${NC}"
else
   sts_xtl="${RED}Running ✖${NC}"
fi

if [[ $xvln == "running" ]]; then 
   sts_xtn="${GREEN}Running ✔${NC}"
else
   sts_xtn="${RED}Running ✖${NC}"
fi

if [[ $vmgrpc == "running" ]]; then 
   sts_vmg="${GREEN}Running ✔${NC}"
else
   sts_vmg="${RED}Running ✖${NC}"
fi

if [[ $vlgrpc == "running" ]]; then 
   sts_vlg="${GREEN}Running ✔${NC}"
else
   sts_vlg="${RED}Running ✖${NC}"
fi

if [[ $trgrpc == "running" ]]; then 
   sts_trg="${GREEN}Running ✔${NC}"
else
   sts_trg="${RED}Running ✖${NC}"
fi


if [[ $ohp_service == "running" ]]; then 
   status_ohp="${GREEN}Running ✔ ${NC}"
else
   service_ohp="${RED} Not Running ✖ ${NC}"
fi

if [[ $openvpn_service == "exited" ]]; then 
   status_openvpn="${GREEN}Running ✔${NC}"
else
   status_openvpn="${RED}Not Running ✖${NC}"
fi 

if [[ $webmin_service == "perl" ]]; then 
   status_webmin="${GREEN}Running ✔${NC}"
else
   status_webmin="${RED}Not Running ✖${NC}"
fi 

if [[ $nginx_service == "running" ]]; then 
   status_nginx="${GREEN}Running ✔ ${NC}"
else
   status_nginx="${RED}Not Running ✖${NC}"
fi 

if [[ $wg_service == "running" ]]; then 
   status_wg="${GREEN}Running ✔ ${NC}"
elif [[ $wg_service == "exited" ]]; then
    status_wg="${GREEN}Running ✔ ${NC}"
else
   status_wg="${RED}Not Running ✖${NC}"
fi
clear
echo -e "$BLUE=====================================${NC}"
echo -e "| Service Status Installed In VPS   |" 
echo -e "$BLUE=====================================${NC}" 
echo -e "

STATUS SSH & OPEN VPN:
"$BLUE-----------------${NC}" 
SSH         = $status_ssh
OpenVPN     = $status_openvpn
Dropbear    = $status_dropbear
STUNNEL4    = $status_stunnel4
Squid       = $status_squid
OHP         = $status_ohp

VMess Status: 
"$BLUE-----------------${NC}" 
V2Ray VMess TLS      = $status_v2ray
V2Ray VMess Non TLS  = $status_v2rayn
XRay VMess TLS       = $sts_xvm
XRay VMess Non-TLS   = $sts_xvmn
XRay VMess GPRC TLS  = $sts_vmg

VLess Status:
"$BLUE-----------------${NC}" 
V2Ray VLess TLS      = $status_vless
V2Ray VLess Non-TLS  = $status_vlessn
XRay VLess TLS       = $sts_xtl
XRay VLess Non-TLS   = $sts_xtn
XRay VLess GRPC TLS  = $sts_vlg

STATUS TROJAN:
"$BLUE-----------------${NC}" 
V2Ray Trojan WS      = $status_trojan
XRay TRojan TCP TLS  = $status_xtr
XRay TRojan GRPC TLS = $sts_trg

STATUS WIREGUARD:
"$BLUE-----------------${NC}" 
Wireguard   = $status_wg

System Client Status:
"$BLUE-----------------${NC}" 
Fail2Ban    = $status_fail2ban
Webmin      = $status_webmin
Nginx       = $status_nginx
"
echo -e "$blue-----------------------------------------------------------${NC}" 
echo -e ""
echo -e "${green}JIKA TERDAPAT NOT RUNNING, PLEASE REPORT TO ADMIN FOR FIX$NC"
echo -e "${green}Report to PAKYAVPN @anakjati567"
