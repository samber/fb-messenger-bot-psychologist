
FROM node:6

WORKDIR /usr/src/app
CMD npm start

RUN apt-get update \
    && apt-get install -y emacs24-nox \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ADD . /usr/src/app
ADD https://raw.githubusercontent.com/jwiegley/emacs-release/master/lisp/play/doctor.el /usr/src/app

RUN npm install
