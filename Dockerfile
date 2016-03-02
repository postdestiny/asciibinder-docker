FROM centos

RUN yum -y update; yum clean all
RUN yum -y install java ruby ruby-devel ; yum clean all
RUN yum -y install make gcc ; yum clean all
RUN yum -y install gcc-c++ ; yum clean all
RUN yum -y install git httpd ; yum clean all
RUN gem install ascii_binder

CWD /var/tmp
RUN git clone https://github.com/openshift/openshift-docs.git
RUN asciibinder build
RUN mv /var/tmp/openshift-docs

EXPOSE 8080

ENTRYPOINT [ "/usr/sbin/httpd" ]
CMD [ "-D", "FOREGROUND" ]
