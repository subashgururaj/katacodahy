FROM docker.io/nginx:latest

COPY docker/default.conf /etc/nginx/conf.d/default.conf.templ
RUN ls
RUN pwd
COPY docker/conf-builder.sh /usr/bin/conf-builder.sh
RUN ls 
RUN pwd
COPY dist /usr/share/nginx/html
RUN ls 
RUN pwd
RUN chown -R nginx:nginx /usr/share/nginx/html/

EXPOSE 80 443

CMD conf-builder.sh &&\
  nginx -g "daemon off;"
