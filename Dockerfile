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



COPY entrypoint.sh entrypoint.sh
COPY init.sql init.sql


ENTRYPOINT ["/bin/bash", "entrypoint.sh"]