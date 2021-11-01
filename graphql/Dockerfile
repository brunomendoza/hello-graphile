# syntax=docker/dockerfile:1

FROM node:16.13-alpine

WORKDIR /app

COPY package-lock.json package-lock.json
COPY package.json package.json

RUN npm ci --production=false

# https://www.graphile.org/postgraphile/usage-cli/
ENTRYPOINT [ "npx", "postgraphile", "-n", "0.0.0.0" ]