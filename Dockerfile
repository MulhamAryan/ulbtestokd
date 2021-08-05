FROM ubuntu:trusty
RUN apt-get -y && apt-get upgrade -y

RUN apt-get install -y zip unzip
RUN apt-get install -y \
	php \
	php-bz2 \
	php-cgi \
	php-cli \
	php-common \
	php-curl \
	php-dev \
	php-enchant \
	php-fpm \
	php-gd \
	php-gmp \
	php-imap \
	php-interbase \
	php-intl \
	php-json \
	php-ldap \
	php-mbstring \
	php-mcrypt \
	php-mysql \
	php-odbc \
	php-opcache \
	php-pgsql \
	php-phpdbg \
	php-pspell \
	php-readline \
	php-recode \
	php-snmp \
	php-sqlite3 \
	php-sybase \
	php-tidy \
	php-xmlrpc \
	php-xsl \
	php-zip
RUN apt-get install apache2 libapache2-mod-php -y
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