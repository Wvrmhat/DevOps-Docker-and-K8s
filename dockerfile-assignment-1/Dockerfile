# use this empty Dockerfile to build your assignment

FROM node:6-alpine

RUN apk add --no-cache tini

EXPOSE 3000

WORKDIR /usr/src/app

COPY package.json package.json

RUN npm install && npm cache clean --force

COPY . .

CMD ["/sbin/tini", "--", "node", "./bin/www"]


# NOTE: The instructions are now in the README.md file in this directory.
