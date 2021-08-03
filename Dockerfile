FROM ubuntu:trusty
RUN apt -y update
RUN apt -y install apache2
RUN apt -y install php
