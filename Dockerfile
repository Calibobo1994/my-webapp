FROM node:18-alpine
WORKDIR /app
COPY Package.json ./package.json
RUN npm install
COPY . .
EXPOSE 80
CMD ["npm", "start"]