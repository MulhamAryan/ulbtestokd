FROM ubuntu:trusty
RUN apt install -y apache2
RUN httpd -k start
