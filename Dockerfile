
FROM node:24-alpine AS next-app

LABEL org.opencontainers.image.source="https://github.com/thoomassc/next-cda1"

WORKDIR /app

COPY package.json package-lock.json* ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

# Copy entrypoint script
COPY docker/next/entrypoint.sh /usr/local/bin/entrypoint.sh

# Donné les droits d'exécution au script
RUN chmod +x /usr/local/bin/entrypoint.sh

# Execution du script
# Ce script permet de faire un npm install en local
ENTRYPOINT [ "entrypoint.sh" ]

CMD ["npm", "start"]
