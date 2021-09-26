#!/bin/bash
blue='\e[0;34'
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'

clear
banner(){
echo -e $yellow"__  __                ____           _     _"
echo -e $yellow"|  \/  | __ _ ___ ___ / ___|_ __ __ _| |__ | |__   ___ _ __"
echo -e $yellow"| |\/| |/ _- / __/ __| |  _| -__/ _- | -_ \| -_ \ / _ \ -__|"
echo -e $yellow"| |  | | (_| \__ \__ \ |_| | | | (_| | |_) | |_) |  __/ |"
echo -e $yellow"|_|  |_|\__,_|___/___/\____|_|  \__,_|_.__/|_.__/ \___|_|"
read -p "Page: " hal0
read -p "Sampai Page: " hal
}
banner
for((i=1;$hal0<=$hal;i++))
do
ip=$(curl -s "https://websitedetection.com/web-site-list-$i" | grep -oP '<a href="http://(.*?)">(.*?)</a>' | cut -d "<" -f2 | cut -d ">" -f2)
total2=$(cat grepdomen.txt | wc -l)
if [[ $ip =~ '.' ]]; then
echo "$ip" >> grepdomen.txt
ips=$(echo "$ip" | wc -l)
echo -e "${lightgreen}[+] Grab : $ips > Total: $total2 Domen"
else
echo -e "${red}[-] Grab : Site : Error x Total: $total2 Domen"
fi
done

