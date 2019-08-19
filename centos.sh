#########################################################
# Anything wrong? Find me via telegram:@MTProtoConfiger #
#########################################################

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
                yum install tmux -y
                yum -y install screen
fi

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
if [ -z "$TMUX" ]; then
    ./main
fi 

# Display Service Information
clear
echo "PortForwarder Successful Installation！"
echo ""
