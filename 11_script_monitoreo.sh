#!/bin/bash

LOG_FILE="/var/log/monitoreo_seguridad.log"
FECHA=$(date)

echo "=== MONITOREO DE SEGURIDAD - $FECHA ===" >> $LOG_FILE

# Intentos de SSH fallidos
echo "Intentos SSH fallidos:" >> $LOG_FILE
grep "Failed password" /var/log/auth.log | tail -n 5 >> $LOG_FILE

# Conexiones activas
echo "Conexiones activas:" >> $LOG_FILE
ss -tuln >> $LOG_FILE

# Procesos sospechosos
echo "Procesos de red:" >> $LOG_FILE
netstat -tupan | grep LISTEN >> $LOG_FILE

# Estado del firewall
echo "Reglas de firewall activas:" >> $LOG_FILE
sudo iptables -L -n -v >> $LOG_FILE

# Fail2ban status
echo "Estado Fail2ban:" >> $LOG_FILE
sudo fail2ban-client status >> $LOG_FILE
