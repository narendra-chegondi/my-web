FROM nginx
MAINTAINER Narendra
LABEL This is my web site
EXPOSE 80
COPY index.html /usr/share/nginx/html/

