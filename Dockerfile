FROM centos

RUN yum -y update; yum clean all
RUN yum -y install java ruby ruby-devel \
                   make gcc \
                   gcc-c++ \
                   git httpd ; \
                   yum clean all
RUN gem install ascii_binder
WORKDIR /var/tmp
COPY httpd.conf /etc/httpd/conf/httpd.conf

RUN cd /var/tmp
RUN git clone https://github.com/postdestiny/asciibinder-docs.git && cd asciibinder-docs && git checkout 173d900
RUN asciibinder build /var/tmp/asciibinder-docs
RUN mv /var/tmp/asciibinder-docs/_preview/ascii_binder/latest/* /var/www/html/
RUN chown -R apache /var/www/html /var/log/httpd /run/httpd

EXPOSE 8080

USER apache


#CMD /bin/sh -c "while true; do echo hello world; sleep 1; done"
ENTRYPOINT [ "/usr/sbin/httpd" ]
CMD [ "-D", "FOREGROUND" ]
