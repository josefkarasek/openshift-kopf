FROM centos/httpd:latest

ADD ./run.sh ./run.sh

ENV KOPF_VERSION 2.1.1

RUN curl -s -L https://github.com/lmenezes/elasticsearch-kopf/archive/v${KOPF_VERSION}.tar.gz | \
    tar xz -C /tmp && \
    cp -r /tmp/elasticsearch-kopf-${KOPF_VERSION}/_site/* /var/www/html/; \
    rm -rf

RUN yum install -y --setopt=tsflags=nodocs vim mod_ssl && yum clean all

CMD ["/run.sh"]
