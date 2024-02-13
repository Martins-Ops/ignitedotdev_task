FROM node:20-alpine3.18

WORKDIR /app_dir

COPY ["package.json" , "package-lock.json" , "./"]

RUN npm install

COPY . .

EXPOSE 8000

CMD [ "node", "app.js" ]