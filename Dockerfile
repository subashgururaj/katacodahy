FROM node:10-alpine

COPY . /usr/src/app
WORKDIR /usr/src/app/UI
RUN ls
RUN pwd
RUN npm install
RUN npm install bower -g
RUN npm install gulp -g
VOLUME ["/usr/src/app/UI"]
EXPOSE 3000
CMD ["gulp","serve"]
