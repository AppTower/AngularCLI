#!/bin/sh
set -e

if [ -n "$ADMIN_PASSWORD" ]; then
  echo "node:$ADMIN_PASSWORD" | chpasswd
else
  echo "node:node" | chpasswd
fi

/usr/sbin/sshd

exec "$@"
