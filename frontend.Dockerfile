FROM node:lts-alpine

WORKDIR /srv/app
COPY frontend ./frontend
WORKDIR /srv/app/frontend
RUN npm ci
EXPOSE 8000
RUN npm run build
RUN npm install -g serve
WORKDIR /srv/app/frontend/dist
CMD [ "serve", "-s", "-l", "8000" ]