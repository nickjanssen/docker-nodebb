#
# Node.js Dockerfile
#
# https://github.com/dockerfile/nodejs
#

# Pull base image.
FROM dockerfile/ubuntu

# Install Node.js
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nodejs-legacy npm imagemagick -y

RUN cd /opt && git clone https://github.com/NodeBB/NodeBB.git nodebb

# Define working directory.
WORKDIR /opt/nodebb

#Bump version nodebb
RUN git checkout v0.6.1

RUN npm install

VOLUME /opt/nodebb

EXPOSE 4567

# Define default command.
CMD ["node", "app.js"]
