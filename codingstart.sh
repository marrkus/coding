#!/bin/bash
setxkbmap fi
sudo apt-get update
sudo apt-get -y install puppet git

git clone https://github.com/marrkus/coding.git

cd coding/modules
sudo cp -r coding/ /etc/puppet/modules/
cd /etc/puppet/
sudo puppet apply --modulepath modules/ -e 'class {"coding":}'

firefox -new-tab -url https://www.tutorialspoint.com/eclipse/eclipse_create_java_project.htm
firefox -new-tab -url https://www.w3schools.com/html/html_elements.asp
firefox -new-tab -url 172.28.171.196/~$USER
nano /home/xubuntu/public_html/index.html


echo "***************************"
echo " "
echo "Ready to use"
echo " "
echo "***************************"
