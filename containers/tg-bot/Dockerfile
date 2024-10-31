FROM node:18-alpine

WORKDIR /tg-bot

# COPY ./package*.json ./
COPY ../../repositories/tg-bot/package*.json ./

RUN npm install

COPY ../../repositories/tg-bot ./

CMD ["sh", "-c", "cd src && node app.js"]
