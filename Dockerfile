FROM node:14 AS dev
WORKDIR /work
ENTRYPOINT [ "sh" ]

FROM node:14 as build
WORKDIR /app
COPY package*.json .
RUN npm ci
COPY . .
RUN npm run build

FROM node:14-alpine as runtime
WORKDIR /dist
COPY --from=build /app .
CMD [ "npm", "run", "serve:ssr" ]