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

sudo yum update -y
sudo yum upgrade -y
sudo yum install tmux -y
sudo yum -y install screen
sudo wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
sudo yum install golang-bin -y
sudo wget -N --no-check-certificate https://raw.githubusercontent.com/ZarinNegah/PortForwarder/master/main.go
sudo wget -N --no-check-certificate https://raw.githubusercontent.com/ZarinNegah/PortForwarder/master/rules.json
sudo go build main.go
sudo tmux
if [ -z "$TMUX" ]; then
    ./main
fi 

# Display Service Information
clear
echo "PortForwarder Successful Installation！"
echo ""
