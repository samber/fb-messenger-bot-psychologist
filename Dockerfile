
FROM node:6

RUN apt-get update && apt-get install -y emacs

WORKDIR /usr/src/app
CMD npm start

ADD . /usr/src/app
RUN npm install
