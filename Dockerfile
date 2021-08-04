FROM ubuntu:trusty
RUN apt install -y apache2
RUN apachectl start
