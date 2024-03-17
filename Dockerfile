FROM node:lts
RUN apt-get update
RUN apt-get install -y sudo openssh-server vim
RUN usermod -aG sudo node
RUN mkdir /var/run/sshd
RUN npm install --location=global npm@latest
RUN npm install --location=global @angular/cli@16.2.10
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bash"]
