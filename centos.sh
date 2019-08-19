#########################################################
# Anything wrong? Find me via telegram:@MTProtoConfiger #
#########################################################

#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

#Check Root
[ $(id -u) != "0" ] && { echo "${CFAILURE}Error: You must be root to run this script${CEND}"; exit 1; }

#Check OS
if [ -n "$(grep 'Aliyun Linux release' /etc/issue)" -o -e /etc/redhat-release ]; then
  OS=CentOS
  [ -n "$(grep ' 7\.' /etc/redhat-release)" ] && CentOS_RHEL_version=7
  [ -n "$(grep ' 6\.' /etc/redhat-release)" -o -n "$(grep 'Aliyun Linux release6 15' /etc/issue)" ] && CentOS_RHEL_version=6
  [ -n "$(grep ' 5\.' /etc/redhat-release)" -o -n "$(grep 'Aliyun Linux release5' /etc/issue)" ] && CentOS_RHEL_version=5
elif [ -n "$(grep 'Amazon Linux AMI release' /etc/issue)" -o -e /etc/system-release ]; then
  OS=CentOS
  CentOS_RHEL_version=6
else
  echo "${CFAILURE}Does not support this OS, Please contact the author! ${CEND}"
  kill -9 $$
fi

# Detect CPU Threads
THREAD=$(grep 'processor' /proc/cpuinfo | sort -u | wc -l)

# Define the Terminal Color
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

# Print Welcome Message
clear
echo "---------------------------------------------"
echo "  Install MTProto For Telegram with NodeJs"
echo "  Author: ZarinNegah"
echo "  URL: http://Fastsetup.MTProtoServer.ir/"
echo "  Telegram: https://t.me/MTProtoConfiger"
echo "---------------------------------------------"
echo ""

if [ ${OS} == CentOS ]; then
	        sudo yum update -y
                sudo yum upgrade -y
                sudo yum install wget nano -y
                sudo yum install epel-release -y
                sudo yum search htop -y
                sudo yum info htop -y
                sudo yum install htop -y
                yum install nload -y
                yum install tmux -y
                yum -y install screen
fi

# Get Native IP Address
IP=$(curl -4 -s ip.sb)

# Download PortForwarder project source code
if [[ ${OS} == CentOS ]]; then
	if [[ $CentOS_RHEL_version == 7 ]]; then
	       sudo wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
               sudo yum install golang-bin -y
               sudo wget -N --no-check-certificate https://raw.githubusercontent.com/ZarinNegah/PortForwarder/master/main.go
               sudo wget -N --no-check-certificate https://raw.githubusercontent.com/ZarinNegah/PortForwarder/master/rules.json
	fi
fi
sudo go build main.go
sudo tmux
./main

# Display Service Information
clear
echo "PortForwarder Successful Installation！"
echo ""
