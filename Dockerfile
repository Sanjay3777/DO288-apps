# Use the httpd-parent image as base
FROM quay.io/redhattraining/httpd-parent
FROM registry.access.redhat.com/ubi8/ubi:8.0 1
MAINTAINER="Red Hat Training <training@redhat.com>"

# DocumentRoot for Apache
 ENV DOCROOT=/var/www/html 2
#
RUN   yum install -y --no-docs --disableplugin=subscription-manager httpd && yum clean all --disableplugin=subscription-manager -y && echo "Hello from the httpd-parent container!" > ${DOCROOT}/index.html && rm -rf /run/httpd && mkdir /run/httpd

#
#             # Allows child images to inject their own content into DocumentRoot
ONBUILD COPY src/ ${DOCROOT}/ 4
#
EXPOSE 80
#
#             # This stuff is needed to ensure a clean start
RUN rm -rf /run/httpd && mkdir /run/httpd
#
#             # Run as the root user
USER root 5
#
#             # Launch httpd
CMD /usr/sbin/httpd -DFOREGROUND
~                           
