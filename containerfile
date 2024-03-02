FROM centos
RUN mkdir -p /var/www/html && echo "Hello container!" > /var/www/html/index.html && rm -rf /run/httpd && mkdir /run/httpd
LABEL version="1.0" description="this is Containerfile" MAINTAINER="RED HAT TRAINING"
ENV DOCROOT=/var/www/html

ONBUILD COPY src/ /var/www/html
EXPOSE 80
USER root
CMD /usr/sbin/httpd -DFOREGROUND

