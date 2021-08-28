FROM luke19/mysql-base-image:1629521420

LABEL maintainer="KieniL"
LABEL name="dbinstaller"
LABEL version="1.0.0"
LABEL author="KieniL"
LABEL contact="https://github.com/KieniL/FamilyCluster_DBInstaller/issues"
LABEL documentation="https://github.com/KieniL/FamilyCluster_DBInstaller"

ENV ADD_DUMMYDATA=false
ENV DB_HOST=tmp
ENV DB_PORT=tmp

VOLUME /etc/config

WORKDIR /install


COPY entrypoint.sh /install/entrypoint.sh
COPY --chown=mysql init.sql /install/init.sql
COPY --chown=mysql dummydata.sql /install/dummydata.sql

RUN chmod 777 init.sql && chmod 777 dummydata.sql



ENTRYPOINT ["/bin/bash", "entrypoint.sh"]