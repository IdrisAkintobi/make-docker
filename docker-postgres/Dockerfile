# Use the official PostgreSQL image from the Docker Hub
FROM postgres:17.4

# Create the WAL archive directory and set permissions
RUN mkdir -p /mnt/server/archivedir && chown postgres:postgres /mnt/server/archivedir

# Copy the custom PostgreSQL configuration file (optional)
COPY postgres.conf /usr/share/postgresql/postgresql.conf.sample

# Expose the default PostgreSQL port
EXPOSE 5432

# Use the default command to run PostgreSQL
CMD ["postgres"]
