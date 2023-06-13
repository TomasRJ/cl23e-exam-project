FROM node:lts-alpine

WORKDIR /srv/app
COPY backend ./backend
WORKDIR /srv/app/backend
RUN npm ci
RUN npm install -g sequelize-cli@6.6.1
EXPOSE 3000