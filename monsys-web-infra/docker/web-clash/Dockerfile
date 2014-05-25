#FROM ubuntu:12.04
FROM dockerfile/ubuntu

RUN apt-get update
RUN apt-get install -y apache2 libapache2-mod-php5
RUN apt-get install -y curl git htop unzip vim wget telnet net-tools
RUN a2enmod php5

ADD site-content /var/www/
ADD site-config /etc/apache2/sites-enabled

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]
