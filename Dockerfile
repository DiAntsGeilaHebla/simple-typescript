# Basis-Image
FROM node:18

# Arbeitsverzeichnis erstellen
WORKDIR /app

# package.json, yarn.lock und eslint.config.mjs kopieren
COPY package*.json yarn.lock eslint.config.mjs ./

# Abhängigkeiten installieren
RUN yarn install

# Restliche App-Dateien kopieren (falls noch benötigt)
COPY . .

# Linting ausführen
RUN yarn lint

# Tests ausführen
RUN yarn test

# TypeScript-Code bauen
RUN yarn build

# Startbefehl
CMD ["node", "build/index.js"]
