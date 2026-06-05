#!/bin/bash
# Script para capturar TODAS las evidencias del proyecto

FECHA=$(date +%Y%m%d_%H%M%S)
DIR_BASE="$HOME/PROYECTO_FINAL"
DIR_BACKUP="$HOME/proyecto_backup_$FECHA"

echo "Iniciando captura de evidencias..."
mkdir -p $DIR_BACKUP
cp -r $DIR_BASE/* $DIR_BACKUP/

echo "Creando archivo comprimido..."
cd $HOME
tar -czf proyecto_completo_$FECHA.tar.gz PROYECTO_FINAL/

echo "Backup completado: proyecto_completo_$FECHA.tar.gz"
echo "Ubicación: $HOME/"
