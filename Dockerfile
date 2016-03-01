FROM centos

RUN yum -y update; yum clean all
RUN yum -y install java ruby ruby-devel ; yum clean all
RUN yum -y install make gcc ; yum clean all
RUN yum -y install gcc-c++ ; yum clean all
RUN yum -y install git ; yum clean all
RUN gem install ascii_binder

CMD /bin/sh -c "while true; do echo hello world; sleep 1; done"
