FROM node:latest AS build
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .  
RUN npm run build  


FROM nginx:latest
COPY --from=build /app/dist /usr/share/nginx/html  
CMD ["nginx", "-g", "daemon off;"] 
