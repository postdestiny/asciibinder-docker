FROM centos

RUN yum -y update; yum clean all
RUN yum -y install java ruby ruby-devel ; yum clean all
RUN yum -y install make gcc ; yum clean all
RUN yum -y install gcc-c++ ; yum clean all
RUN yum -y install git httpd ; yum clean all
RUN gem install ascii_binder
#RUN asciibinder create /var/tmp/docs
WORKDIR /var/tmp
CMD cd /var/tmp
CMD git clone https://github.com/postdestiny/asciibinder-docker.git
#COPY . /var/tmp/docs
#COPY .git /var/tmp/docs/
#COPY httpd.conf /etc/httpd/httpd.conf
#RUN ls -lR /var/tmp
#RUN asciibinder build /var/tmp/asciibinder-docker
#RUN mv /var/tmp/asciibinder-docker/_preview/ascii_binder/latest/* /var/www/htdocs/
#RUN chown -r apache /var/www/htdocs

#EXPOSE 8080

#USER apache

CMD /bin/sh -c "while true; do echo hello world; sleep 1; done"
#ENTRYPOINT [ "/usr/sbin/httpd" ]
#CMD [ "-D", "FOREGROUND" ]
