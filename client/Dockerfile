FROM node:alpine
RUN apk add --no-cache tzdata
ENV TZ Europe/Moscow
ENV NODE_PATH /client/node_modules
WORKDIR /client/
COPY package*.json ./
RUN npm i
COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]