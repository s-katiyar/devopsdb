FROM postgres
ENV POSTGRES_DB enterprisedb
ENV POSTGRES_USER core_admin
COPY database.sql /docker-entrypoint-initdb.d/