FROM centos
LABEL version="1.0" maintainer="Red Hat Training<training@redhat.com>" 
#DocumentRoot for Apache

RUN mkdir -p /var/www/html && rm -rf /run/httpd && mkdir /run/httpd
ONBUILD COPY src/ /var/www/html

#Run as the root user
USER root

#Launch httpd
CMD /usr/sbin/httpd -DFOREGROUND
