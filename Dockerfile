FROM node:lts-buster
RUN apt-get update
RUN apt-get install -y sudo openssh-server vim
RUN usermod -aG sudo node
RUN mkdir /var/run/sshd
RUN npm install -g npm@latest
RUN echo N | npm install -g @angular/cli@12.2.1
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bash"]
