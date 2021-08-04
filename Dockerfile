FROM ubuntu:trusty
RUN apt-get install -y apache2
RUN apachectl start
