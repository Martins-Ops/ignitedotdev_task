FROM node:20-alpine3.17

WORKDIR /app_dir

COPY ["package.json" , "package-lock.json" , "./"]

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "node", "app.js" ]