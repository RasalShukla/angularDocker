#Stage1
FROM  node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

#Stage2
FROM nginx:alpine
COPY --from=node /app/dist/angular-app-docker /usr/share/nginx/html