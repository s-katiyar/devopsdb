FROM postgres
ENV POSTGRES_PASSWORD docker
ENV POSTGRES_DB emission_factors
COPY ef.sql /docker-entrypoint-initdb.d/
