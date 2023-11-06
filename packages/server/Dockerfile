FROM node:20

WORKDIR /hodoan/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3002

CMD [ "npm", "run","start" ]