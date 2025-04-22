# Use the official MinIO image
FROM minio/minio:RELEASE.2025-04-08T15-41-24Z

# Create directories for MinIO data and configuration
RUN mkdir -p /mnt/data /root/.minio && \
    chmod -R 755 /mnt/data /root/.minio

# Copy the custom MinIO config file
COPY minio.env /root/.minio/minio.env

# Expose MinIO ports
EXPOSE 9000 9001

# Start MinIO server with configuration
CMD ["server", "/mnt/data", "--console-address", ":9001"]
