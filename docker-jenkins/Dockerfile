# Use the official Jenkins image from Docker Hub
FROM jenkins/jenkins:lts

# Set user to root to allow installation of necessary tools
USER root

# Install necessary plugins and tools
RUN apt-get update && \
    apt-get install -y sudo curl git && \
    curl -fsSL https://get.docker.com | sh && \
    usermod -aG docker jenkins

# Expose the Jenkins port
EXPOSE 8080

# Set the Jenkins home directory (optional)
ENV JENKINS_HOME=/var/jenkins_home

# Set the default command to run Jenkins
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
