FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx

# copy the output of previous build and put into the nginx container

COPY --from=builder /app/build /usr/share/nginx/html

