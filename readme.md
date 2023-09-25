# PiHole + Undound + Wireguard + Portainer + ResilioSync

## PreInstall steps:
- run ```docker-install.sh```
- verify docker installation
- if running on raspberry pi os run ```sudo apt install linux-modules-extra-raspi```
- reboot system
- open port ```51820/udp``` on the router for the device in use
- add duckDNS subdomain

## Installation
- edit the .env file
- run ```docker-compose up```

## Post Install
| Service     | port            |
| ----------- | --------------- |
| portainer   | localhost:9000  |
| pi-hole     | $PiHoleIP/admin |
| resilioSync | localhost/8888  |

- Configuration of pihole:
    1. Add list from https://firebog.net/
    2. Change Router DNS to manual -> ipv4 = $PiHoleIP (1.1.1.1 as secondary)
    3. Change PiHole WebUI -> setting -> DNS -> $UnboundIP#5335

## Internet Connectivity Issue:
### configuring Wireguard:

change  "PostUp" and "PostDown" parameter in ./appdata/wireguard/config/wg0.conf with the following
    - ```PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth+ -j MASQUERADE```
    - ```PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth+ -j MASQUERADE```








