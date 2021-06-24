FROM node:alpine

WORKDIR /app

COPY package.json .

RUN yarn install

COPY . .

CMD ["yarn", "build"]

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html

