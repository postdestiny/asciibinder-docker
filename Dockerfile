FROM centos

RUN yum -y update; yum clean all
RUN yum -y install java ruby ruby-devel ; yum clean all
RUN yum -y install make gcc ; yum clean all
RUN yum -y install gcc-c++ ; yum clean all
RUN yum -y install git httpd ; yum clean all
RUN gem install ascii_binder

WORKDIR /var/tmp
ADD docs /var/tmp
RUN asciibinder build
RUN mv /var/tmp/* /var/www/htdocs/
CHOWN -r apache /var/www/htdocs

USER apache

EXPOSE 8080

ENTRYPOINT [ "/usr/sbin/httpd" ]
CMD [ "-D", "FOREGROUND" ]
