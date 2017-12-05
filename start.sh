#!/bin/bash
setxkbmap fi
sudo apt-get update
sudo apt-get -y install puppet git

git clone https://github.com/marrkus/coding.git

cd coding/modules
sudo cp -r coding/ /etc/puppet/modules/
cd /etc/puppet/

sudo puppet apply --modulepath modules/ -e 'class {"coding":}'
firefox localhost/~xubuntu
nano /home/xubuntu/public_html/index.html


echo "***************************"
echo " "
echo "Ready to use"
echo " "
echo "***************************"
