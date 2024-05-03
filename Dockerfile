FROM oven/bun:latest as build

WORKDIR /raptordocs

COPY . .

RUN bun install

RUN bun run build

FROM nginx:alpine as release

COPY --from=build /build/ /usr/share/nginx/html