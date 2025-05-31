# Basis-Image
FROM node:18

# Arbeitsverzeichnis erstellen
WORKDIR /app

# package.json und yarn.lock kopieren
COPY package*.json yarn.lock ./

# Abhängigkeiten installieren
RUN yarn install

# Restliche Dateien kopieren
COPY . .

# TypeScript-Code bauen
RUN yarn build

# Startbefehl
CMD ["node", "build/index.js"]
