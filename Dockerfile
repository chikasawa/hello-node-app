# Use uma imagem base oficial do Node.js (Alpine é leve)
FROM node:18-alpine AS builder

# Defina o diretório de trabalho dentro do container
WORKDIR /usr/src/app

# Copie package.json e package-lock.json primeiro para aproveitar o cache do Docker
COPY app/package*.json ./

# Instale as dependências de produção
RUN npm install --only=production

# Copie o restante do código da aplicação
COPY app/ .

# Exponha a porta que a aplicação usa dentro do container
EXPOSE 3000

# Comando para iniciar a aplicação
CMD [ "node", "app.js" ]