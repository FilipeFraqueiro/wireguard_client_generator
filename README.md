# Wireguard Client Generator
Generate a Wireguard Client

Change the server_ip variables

This assumes that the WireGuard VPN server IP is at 192.168.8.1
And the range is 192.168.8.1/24

Run exemple: 
./generate_clients.sh client_test 2

The script also assumes Full Tunnel. 
To change this behavior replace:

AllowedIPs = 0.0.0.0/0

By, for example:

AllowedIPs = 192.168.8.1/24

You can also change other settings like the desired port and DNS server.
