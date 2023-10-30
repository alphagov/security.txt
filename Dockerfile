FROM nginx
WORKDIR /tmp
RUN rm -f /usr/share/nginx/html/index.html
RUN apt update && apt install make
COPY paas_app /tmp/paas_app
COPY Makefile /tmp
COPY security.txt /tmp
COPY thanks.txt /tmp
RUN  make build
COPY default.conf /etc/nginx/conf.d
COPY security.txt /usr/share/nginx/html
COPY thanks.txt /usr/share/nginx/html
