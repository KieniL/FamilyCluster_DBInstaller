FROM luke19/mysql-base-image:1629007085

ENV ADD_DUMMYDATA=false

VOLUME /etc/config

WORKDIR /install


COPY entrypoint.sh /install/entrypoint.sh
COPY --chown=mysql init.sql /install/init.sql
COPY --chown=mysql dummydata.sql /install/dummydata.sql

RUN chmod 777 init.sql && chmod 777 dummydata.sql



ENTRYPOINT ["/bin/bash", "entrypoint.sh"]