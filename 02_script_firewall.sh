#!/bin/bash

# Limpiar reglas existentes
sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F

# Políticas por defecto
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT ACCEPT

# Permitir loopback
sudo iptables -A INPUT -i lo -j ACCEPT

# Permitir tráfico establecido
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Limitar SSH (solo desde subred interna)
sudo iptables -A INPUT -p tcp --dport 22 -s 192.168.56.0/24 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j LOG --log-prefix "SSH_ATTACK: "

# Limitar conexiones SSH
sudo iptables -A INPUT -p tcp --dport 22 -m connlimit --connlimit-above 3 -j DROP

# Permitir servicios necesarios
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 21 -s 192.168.56.0/24 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 53 -j ACCEPT

# Logging de tráfico bloqueado
sudo iptables -A INPUT -j LOG --log-prefix "IPTABLES_DROP: "

# Guardar reglas
sudo iptables-save > /etc/iptables/rules.v4
