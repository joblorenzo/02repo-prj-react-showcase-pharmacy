# Usa un'immagine base Node.js dalla versione 14
FROM node:14

# Imposta la directory di lavoro all'interno del container
WORKDIR /app

# Copia il package.json e il package-lock.json nella directory di lavoro
COPY package*.json ./

# Installa le dipendenze del progetto
RUN npm install

# Copia il resto dei file nell'applicazione
COPY . .

# Esegui il build dell'applicazione React
RUN npm run build

# Installa il pacchetto serve globalmente
RUN npm install -g serve

# Comando di default per avviare l'applicazione
CMD ["serve", "-s", "build"]

# Espone la porta 5000 per la comunicazione
EXPOSE 5000
