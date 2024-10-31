FROM node:18-alpine

WORKDIR /api-gateway

COPY ../../repositories/api-gateway/package*.json ./

RUN npm install

COPY ../../repositories/api-gateway ./

RUN npm run build

CMD ["npm", "run", "dev"]
