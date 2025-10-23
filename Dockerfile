#stage 1 building react

FROM node:alpine as base

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

#stage 2 running in nginx react

FROM nginx:alpine

COPY --from=base /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]