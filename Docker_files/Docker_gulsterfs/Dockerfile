FROM resin/rpi-raspbian:jessie

RUN apt-get update && \
    apt-get install -y glusterfs-server git wget python-pip

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN GIT_SSL_NO_VERIFY=true git clone https://github.com/aravindavk/glusterfs-rest.git
WORKDIR glusterfs-rest
RUN python setup.py install
RUN ln -s /usr/local/bin/gunicorn /usr/bin/gunicorn
RUN glusterrest port 8080 || true
RUN glusterrest install || true
RUN glusterrest useradd pi -g glusterroot --password toor

WORKDIR /

RUN mkdir node_storage

EXPOSE 111 2049 8080 24007 24008 38465 38466 38467 49152 49153 49154 49156 49157 49158 49159 49160 49161 49162 49163

CMD service glusterfs-server start && glusterrestd
