#!/bin/bash

server_ip="X.X.X.X"
client_name=$1
ip_last_octet=$2

privatekey=$( wg genkey )
publickey=$( echo $privatekey | wg pubkey )

conf_file="/etc/wireguard/wg0_$client_name.conf"
rm $conf_file
touch $conf_file

echo "[Interface]" >> $conf_file
echo "Address = 192.168.8.$ip_last_octet/24" >> $conf_file
echo "ListenPort = 51820" >> $conf_file
echo "PrivateKey = $privatekey" >> $conf_file
echo "PublicKey = $publickey" >> $conf_file
echo "DNS = 192.168.8.1" >> $conf_file
echo "" >> $conf_file
echo "[Peer]" >> $conf_file
echo "Endpoint = $server_ip:51820" >> $conf_file
echo "PublicKey = $( cat /etc/wireguard/pubkey )" >> $conf_file
echo "AllowedIPs = 0.0.0.0/0" >> $conf_file


echo "[+] Generated file: $conf_file"
echo "[+] Client IP 192.168.8.$ip_last_octet"
