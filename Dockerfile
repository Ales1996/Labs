cd docker_project_apl/
vim Dockerfile
sudo mkdir web .
cd web
sudo mkdir etc
sudo mkdir www
sudo docker build -t plyasun/apache2 .
sudo docker run -p 8081:80 -d plyasun/apache2
curl localhost:8081

Dockerfile

FROM ubuntu:trusty

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y apache2 ntp default-jdk

WORKDIR /var/www/site

RUN mkdir -p web/etc && mkdir web/www

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

