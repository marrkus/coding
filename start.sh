#!/bin/bash
setxkbmap fi
sudo apt-get update
sudo apt-get -y install puppet git

git clone https://github.com/marrkus/coding.git

cd coding/modules
sudo cp -r coding/ /etc/puppet/modules/
cd /etc/puppet/

sudo puppet apply --modulepath modules/ -e 'class {"coding":}'
nano /home/xubuntu/public_html/index.html
firefox localhost/~xubuntu

echo "***************************"
echo " "
echo "Ready to use"
echo " "
echo "***************************"
