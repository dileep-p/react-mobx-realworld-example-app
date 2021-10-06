FROM quay.io/bitnami/node:12.22.6 as build
WORKDIR /app
COPY package*.json  ./
RUN npm install
COPY . ./

FROM quay.io/bitnami/node:12.22.6 as app
WORKDIR /app
COPY --from=build /app/ ./
CMD ["npm", "start"]
