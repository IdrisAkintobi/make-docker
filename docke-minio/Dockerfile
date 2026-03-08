# Use the official MinIO image
FROM pgsty/minio:latest

# Create directories for MinIO data and configuration
RUN mkdir -p /mnt/data /root/.minio && \
    chmod -R 755 /mnt/data /root/.minio

# Copy the custom MinIO config file (with user-friendly error handling)
COPY minio.env* /tmp/
RUN if [ ! -f /tmp/minio.env ]; then \
        echo "ERROR: minio.env file not found!" && \
        echo "Please copy minio.env.example to minio.env and configure it:" && \
        echo "  cp minio.env.example minio.env" && \
        echo "  # Edit minio.env with your desired configuration" && \
        exit 1; \
    fi && \
    mv /tmp/minio.env /root/.minio/minio.env

# Expose MinIO ports
EXPOSE 9000 9001

# Start MinIO server with configuration
CMD ["server", "/mnt/data", "--console-address", ":9001"]
