FROM alpine:3.18

# Instalar cliente SSH, certificados y StrongSwan (cliente VPN IPSec)
RUN apk add --no-cache \
    openssh-client \
    ca-certificates \
    bash \
    strongswan

# Copiar archivos de configuración de IPSec al contenedor
COPY ./ipsec.conf /etc/ipsec.conf
COPY ./ipsec.secrets /etc/ipsec.secrets

# Script de inicio para arrancar el VPN y mantener el contenedor en ejecución
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]

