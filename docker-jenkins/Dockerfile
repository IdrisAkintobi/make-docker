# Start from official Jenkins LTS image
FROM jenkins/jenkins:lts

# Switch to root for installations
USER root

# Install tools and Docker CLI
RUN apt-get update && \
    apt-get install -y sudo curl git && \
    curl -fsSL https://get.docker.com | sh && \
    usermod -aG docker jenkins && \
    rm -rf /var/lib/apt/lists/*

# Copy plugin list and install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# Copy Jenkins Configuration as Code (JCasC) YAML file
COPY jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml

# Tell Jenkins to load the YAML on startup
ENV CASC_JENKINS_CONFIG=/usr/share/jenkins/ref/jenkins.yaml

# Expose Jenkins port
EXPOSE 8080

# Optional: Define Jenkins home
ENV JENKINS_HOME=/var/jenkins_home

# Switch back to Jenkins user (default behavior)
USER jenkins

# Default Jenkins startup command
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
