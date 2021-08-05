FROM ubuntu:18.04
RUN apt-get update
 && apt-get upgrade -y\
 && apt-get install -y python \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y \
	php8.0 \
	php8.0-bz2 \
	php8.0-cgi \
	php8.0-cli \
	php8.0-common \
	php8.0-curl \
	php8.0-dev \
	php8.0-enchant \
	php8.0-fpm \
	php8.0-gd \
	php8.0-gmp \
	php8.0-imap \
	php8.0-interbase \
	php8.0-intl \
	php8.0-json \
	php8.0-ldap \
	php8.0-mbstring \
	php8.0-mcrypt \
	php8.0-mysql \
	php8.0-odbc \
	php8.0-opcache \
	php8.0-pgsql \
	php8.0-phpdbg \
	php8.0-pspell \
	php8.0-readline \
	php8.0-recode \
	php8.0-snmp \
	php8.0-sqlite3 \
	php8.0-sybase \
	php8.0-tidy \
	php8.0-xmlrpc \
	php8.0-xsl \
	php8.0-zip
RUN apt-get install apache2 libapache2-mod-php8.0 -y
RUN apt-get install mariadb-common mariadb-server mariadb-client -y

COPY info.php /var/www/html/
COPY index.html /var/www/html/

RUN chown -R www-data:www-data /var/www/html
RUN a2enmod rewrite

VOLUME /var/www/html
VOLUME /var/log/httpd
VOLUME /var/lib/mysql
VOLUME /var/log/mysql
VOLUME /etc/apache2

EXPOSE 80
EXPOSE 3306
CMD ["bash"]
