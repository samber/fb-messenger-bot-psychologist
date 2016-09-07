
FROM node:6

WORKDIR /usr/src/app
CMD npm start

RUN apt-get update \
    && apt-get install -y emacs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ADD . /usr/src/app
RUN npm install
