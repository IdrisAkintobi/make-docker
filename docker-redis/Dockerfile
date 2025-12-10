# Use the official Redis image from the Docker Hub
FROM redis:7.4

# Copy the custom Redis configuration file
COPY redis.conf /usr/local/etc/redis/redis.conf

# Expose the default Redis port
EXPOSE 6379

# Start Redis server with the custom configuration
CMD ["sh", "-c", "\
    if [ -n \"$REDIS_PASSWORD\" ]; then \
    redis-server /usr/local/etc/redis/redis.conf --requirepass \"$REDIS_PASSWORD\"; \
    else \
    redis-server /usr/local/etc/redis/redis.conf; \
    fi"]
