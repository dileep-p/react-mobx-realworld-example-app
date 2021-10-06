FROM quay.io/dileep-p/node:11.5 as build
WORKDIR /app
COPY package*.json  ./
RUN npm install
COPY . ./

FROM quay.io/dileep-p/node:11.5 as app
WORKDIR /app
COPY --from=build /app/ ./
CMD ["npm", "start"]
