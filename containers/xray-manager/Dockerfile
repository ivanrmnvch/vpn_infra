FROM node:18-alpine

WORKDIR /xray-manager

COPY ../../repositories/xray-manager/package*.json ./

RUN npm install

COPY ../../repositories/xray-manager ./

CMD ["npm", "run", "start"]
