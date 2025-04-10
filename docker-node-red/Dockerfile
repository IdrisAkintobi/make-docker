# Use the official Node-RED image from Docker Hub
FROM nodered/node-red

# Set a working directory
WORKDIR /usr/src/node-red

# Copy the necessary files into the container
COPY settings.js /data/settings.js
COPY package.json /data/package.json

# Install additional Node.js packages if required
RUN npm install --unsafe-perm --prefix /data

# Expose the default Node-RED port
EXPOSE 1880

# Run Node-RED when the container starts
CMD ["node", "/usr/src/node-red/red.js", "-u", "/data"]
