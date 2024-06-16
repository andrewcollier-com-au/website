#!/bin/bash
echo "First Install Dependencies"
apt update
apt install htop wget refind sudo

wget https://raw.githubusercontent.com/andrewcollier-com-au/website/main/update-sources.sh
chmod +x update-sources.sh
./update-sources.sh


wget https://raw.githubusercontent.com/andrewcollier-com-au/website/main/wifi.sh
chmod +x wifi.sh
./wifi.sh

