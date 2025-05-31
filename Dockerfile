# Basis-Image
FROM node:18

# Arbeitsverzeichnis erstellen
WORKDIR /app

# package.json und yarn.lock kopieren
COPY package*.json yarn.lock ./

# Abhängigkeiten installieren
RUN yarn install

# Linting ausführen
RUN yarn lint

# Tests ausführen
RUN yarn test

# TypeScript-Code bauen
RUN yarn build

# Restliche App-Dateien kopieren (falls noch benötigt)
COPY . .

# Startbefehl
CMD ["node", "build/index.js"]
