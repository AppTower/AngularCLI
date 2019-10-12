FROM this:latest
RUN mkdir -p /home/node/.ssh
RUN cat /etc/ssh/ssh_host_ed25519_key.pub >> /home/node/.ssh/authorized_keys
RUN chmod 600 /home/node/.ssh/authorized_keys
RUN chown node:node /home/node/.ssh/authorized_keys
COPY test.sh /usr/local/bin/
CMD ["test.sh"]
