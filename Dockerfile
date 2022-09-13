FROM centos:latest

LABEL maintainer="Biju.Joseph"

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y install httpd

EXPOSE 80
COPY .  /var/www/html/

ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]


