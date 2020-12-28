FROM node:14.15.0
RUN apt-get update
RUN apt-get install -y sudo openssh-server vim
RUN usermod -aG sudo node
RUN mkdir /var/run/sshd
RUN npm install -g npm@latest
RUN echo N | npm install -g @angular/cli@11.0.5
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bash"]
