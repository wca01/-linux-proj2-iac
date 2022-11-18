#!/bin/bash

echo "atualizando servidor..."
dnf update -y

echo "--Instalando apps----"
dnf install httpd unzip -y

echo "---Iniciando servicos---"
sudo systemctl start httpd
sudo systemctl enable httpd

echo "---Configurando acesso HTTP e Firewall---"
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https 
sudo firewall-cmd --reload

sudo systemctl stop httpd
sudo systemctl restart httpd
sudo systemctl reload httpd

echo "Configurando site..."
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd linux-site-dio-main
cp -R * /var/www/html/
