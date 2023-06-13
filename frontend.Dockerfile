FROM node:lts-alpine

WORKDIR /srv/app
COPY frontend ./frontend
WORKDIR /srv/app/frontend
RUN npm i
EXPOSE 8000
CMD [ "npm", "run", "dev" ]