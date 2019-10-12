#!/bin/sh
set -e

# Check SSH Connection
mkdir -p /home/node/.ssh
cat /etc/ssh/ssh_host_ed25519_key.pub >> /home/node/.ssh/authorized_keys
chmod 600 /home/node/.ssh/authorized_keys
chown node:node /home/node/.ssh/authorized_keys
IP=$(ip address show dev eth0 | sed -n '3,1p' | awk '{print $2}' | awk -F '/' '{print $1}')
ssh -q -o 'StrictHostKeyChecking=no' -i /etc/ssh/ssh_host_ed25519_key node@$IP exit

# Check Angular CLI Version
ng version
if [ -z $(echo $DOCKER_TAG | grep "latest") ] && [ ! -z $(echo $DOCKER_TAG | grep "\.") ]; then
  CURRENT_VER=$(ng version | sed -n '/Angular CLI/p' | awk '{print$3}')
  if [ "$DOCKER_TAG" != "$CURRENT_VER" ]; then
    echo "Error: Tag version != Angular CLI version"
    exit 1
  fi
fi
