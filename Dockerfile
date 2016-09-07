
FROM node:6

WORKDIR /usr/src/app
CMD npm start

#RUN apt-get update \
#    && apt-get install -y emacs \
#    && apt-get clean \
#    && rm -rf /var/lib/apt/lists/*
RUN apk --no-cache add --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ emacs

ADD . /usr/src/app
RUN npm install
