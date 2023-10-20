FROM node:16.10.0-alpine 
RUN apk add --no-cache tzdata
ENV TZ Europe/Moscow
WORKDIR /usr/src/broker
COPY package*.json ./

RUN npm i

COPY . .

EXPOSE 3001

CMD [ "npm" ,"run start"]

