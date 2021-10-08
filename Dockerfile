FROM ubuntu:trusty
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y apache2-utils
RUN apt-get clean
ARG ARG_APACHE_LISTEN_PORT=8000
ENV APACHE_LISTEN_PORT=${ARG_APACHE_LISTEN_PORT}
RUN sed -s -i -e "s/80/${APACHE_LISTEN_PORT}/" /etc/apache2/ports.conf /etc/apache2/sites-available/*.conf
USER www-data
EXPOSE ${APACHE_LISTEN_PORT}
COPY index.html /var/www/html/
EXPOSE 8080 CMD ["apache2ctl", "-D", "FOREGROUND"]
