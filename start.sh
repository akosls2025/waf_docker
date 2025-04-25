#!/bin/bash
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 8443
if command -v docker-compose &> /dev/null; then
docker-compose up
elif docker compose version &> /dev/null; then
docker compose up
else
echo "Neither docker-compose nor docker compose is available."
exit 1
fi


