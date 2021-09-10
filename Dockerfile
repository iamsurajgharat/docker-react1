FROM node:alpine as builder
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .

# this will create build in /usr/app/build folder
RUN npm run build

# second step
FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html