FROM luke19/mysql-base-image:1627573675

ENV DB_HOST=tmp
ENV DB_PORT=1
ENV DB_ADMIN_USER=tmp
ENV DB_ADMIN_PASSWORD=tmp
ENV AUTH_DB=tmp
ENV AUTH_USER=tmp
ENV AUTH_PASS=tmp
ENV ANSPAR_DB=tmp
ENV ANSPAR_USER=tmp
ENV ANSPAR_PASS=tmp
ENV CERT_DB=tmp
ENV CERT_USER=tmp
ENV CERT_PASS=tmp
ENV ADD_DUMMYDATA=false

WORKDIR /install


COPY entrypoint.sh /install/entrypoint.sh
COPY --chown=dbuser init.sql /install/init.sql
COPY --chown=dbuser dummydata.sql /install/dummydata.sql

RUN chmod 777 init.sql && chmod 777 dummydata.sql



ENTRYPOINT ["/bin/bash", "entrypoint.sh"]