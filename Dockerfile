FROM mysql

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



RUN groupadd familygroup && useradd familyuser -G familygroup


COPY entrypoint.sh entrypoint.sh
COPY --chown=familyuser init.sql init.sql

RUN chmod 777 init.sql

USER familyuser

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]