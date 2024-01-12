FROM node:latest as build

WORKDIR /raptordocs

COPY . .

RUN npm install

RUN npm run build

FROM nginx:alpine as release

COPY --from=build /raptordocs/build/ /usr/share/nginx/html