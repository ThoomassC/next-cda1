
FROM node:24-alpine AS next-app

LABEL org.opencontainers.image.source https://github.com/thoomassc/next-cda1

WORKDIR /app

COPY package.json package-lock.json* ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
