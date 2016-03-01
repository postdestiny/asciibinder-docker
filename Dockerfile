FROM centos

RUN yum -y update; yum clean all
RUN yum -y install java ruby ruby-devel ; yum clean all
RUN yum -y install make gcc ; yum clean all
RUN yum -y install gcc-c++ ; yum clean all
RUN yum -y install git httpd ; yum clean all
RUN gem install ascii_binder
RUN asciibinder create /var/tmp/docs
#COPY docs /var/tmp/docs
#WORKDIR /var/tmp/docs
#RUN ls -lR /var/tmp
#RUN asciibinder build /var/tmp/docs
#RUN mv /var/tmp/docs/* /var/www/htdocs/
#CHOWN -r apache /var/www/htdocs

USER apache

EXPOSE 80

ENTRYPOINT [ "/usr/sbin/httpd" ]
CMD [ "-D", "FOREGROUND" ]
