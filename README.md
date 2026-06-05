# Laboratorio de Simulación de Ciberseguridad: Red Team vs Blue Team

## Descripción del Proyecto

Este proyecto consiste en el diseño, implementación y auditoría de un laboratorio de ciberseguridad completamente aislado, con el objetivo de simular un entorno vulnerable y aplicar un ciclo completo de ataque, defensa y hardening.

El laboratorio está compuesto por dos sistemas principales conectados dentro de una red interna controlada:

- **Ubuntu Server 22.04 LTS** como servidor víctima y entorno defensivo.
- **Kali Linux** como estación de atacante para la ejecución de pruebas ofensivas.

La finalidad del proyecto fue identificar vulnerabilidades en servicios críticos, explotar configuraciones inseguras de forma controlada y posteriormente aplicar mecanismos defensivos para reducir la superficie de ataque, mejorar la detección de incidentes y fortalecer la seguridad del sistema.

---

## Fase Ofensiva — Red Team

Durante la fase ofensiva se realizaron pruebas de reconocimiento, enumeración y explotación controlada sobre el servidor Ubuntu, utilizando herramientas ampliamente empleadas en auditorías de seguridad.

### Herramientas utilizadas

- **Nmap:** escaneo de puertos, detección de servicios y versiones.
- **Hydra:** pruebas de fuerza bruta contra servicios de autenticación.
- **Dig:** análisis DNS y validación de configuraciones inseguras.
- **Dirb/Nikto:** enumeración web y detección de configuraciones vulnerables.

### Hallazgos principales

- Identificación de servicios expuestos como **SSH, FTP, DNS, HTTP y MySQL**.
- Detección de configuraciones inseguras en servicios críticos.
- Transferencia de zona DNS exitosa debido a una mala configuración del servidor.
- Exposición de información interna del dominio simulado, incluyendo subdominios sensibles.
- Compromiso de credenciales débiles mediante ataque de fuerza bruta con Hydra.
- Enumeración de rutas y directorios web potencialmente sensibles.

Esta fase permitió evidenciar los riesgos asociados a una infraestructura mal configurada y sin controles de seguridad adecuados.

---

## Fase Defensiva y Hardening — Blue Team

Después de identificar los riesgos principales, se implementaron medidas defensivas con un enfoque de **defensa en profundidad**, orientadas a mitigar los vectores de ataque encontrados durante la fase Red Team.

### Defensas aplicadas

- **Firewall con iptables:**  
  Se configuraron reglas restrictivas para limitar el tráfico entrante y permitir únicamente conexiones necesarias.

- **Protección contra fuerza bruta con Fail2ban:**  
  Se implementaron jails para detectar intentos fallidos de autenticación y bloquear automáticamente direcciones IP maliciosas.

- **Hardening de SSH:**  
  Se deshabilitó el acceso directo del usuario root y se reforzó la autenticación mediante llaves SSH seguras.

- **Llaves SSH con algoritmo ed25519:**  
  Se migró el acceso remoto hacia autenticación basada en llaves criptográficas, reduciendo la dependencia de contraseñas.

- **Monitoreo automatizado de logs:**  
  Se desarrolló un script en Bash para revisar intentos fallidos, conexiones activas, servicios en escucha y estado del firewall.

Estas medidas permitieron reducir significativamente la exposición del servidor y mejorar la capacidad de detección y respuesta ante intentos de intrusión.

---

## Métricas del Proyecto

Los resultados obtenidos después de aplicar las medidas de hardening reflejan una mejora considerable en la postura de seguridad del entorno.

| Reducción de la superficie de ataque en un 70% 
| Intrusiones bloqueadas post-hardening de un 100% 
| Tiempo de detección de incidentes fue menor a 1 minuto 
| Servicios expuestos innecesarios se reducieron significativamente 
| Ataques de fuerza bruta mitigados fueron bloqueados automaticamente mediante Fail2ban 

---

## Resultado Final

El laboratorio permitió simular de manera práctica el ciclo completo de una auditoría de ciberseguridad, desde la identificación y explotación controlada de vulnerabilidades hasta la implementación de controles defensivos efectivos.

Este proyecto demuestra habilidades en:

- Administración básica de servidores Linux.
- Reconocimiento y enumeración de servicios.
- Explotación controlada de vulnerabilidades.
- Hardening de sistemas.
- Configuración de firewall.
- Protección contra fuerza bruta.
- Automatización de monitoreo con Bash.
- Documentación técnica de hallazgos y mitigaciones.

El resultado final fue un entorno más seguro, con menor superficie de ataque, mayor capacidad de detección y mecanismos automáticos de respuesta ante intentos de intrusión.

---

## Documentación y Evidencias del Proyecto

La documentación completa del laboratorio se encuentra organizada en Google Drive.

En esta carpeta se incluyen:

- Reporte técnico completo del laboratorio.
- Capturas de pantalla de la fase ofensiva y defensiva.
- Evidencias de escaneos, explotación y hardening.
- Scripts utilizados para firewall y monitoreo.
- Manuales de configuración.
- Resultados obtenidos antes y después de aplicar las defensas.

**Acceso a la documentación:**  







