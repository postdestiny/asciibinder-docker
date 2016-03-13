FROM centos

RUN yum -y update; yum clean all
RUN yum -y install java ruby ruby-devel \
                   make gcc \
                   gcc-c++ \
                   git httpd ; \
                   yum clean all
RUN gem install ascii_binder
WORKDIR /var/www/html
COPY httpd.conf /etc/httpd/conf/httpd.conf

RUN chown -R apache:root  /var/www/html /var/log/httpd 
RUN chmod 775 /run/httpd
RUN chmod 770 /var/log/httpd
EXPOSE 8080

#USER apache

CMD /bin/sh -c "while true; do echo hello world; sleep 1; done"
#ENTRYPOINT [ "/usr/sbin/httpd" ]
#CMD [ "-D", "FOREGROUND" ]


RUN cd /var/www/html
RUN git clone https://github.com/postdestiny/asciibinder-docs.git && cd asciibinder-docs # && git checkout  0ed4f92
RUN asciibinder build /var/www/html/asciibinder-docs
RUN cp -r /var/www/html/asciibinder-docs/_preview/* /var/www/html
