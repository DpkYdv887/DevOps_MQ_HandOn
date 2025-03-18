# Use an appropriate base image for macOS compatibility
FROM adoptopenjdk/openjdk11:alpine

# Indicate that the project is using an unreleased (development) snapshot version of ActiveMQ 6.2.0
LABEL description="This project uses an unreleased (development) snapshot version of ActiveMQ 6.2.0."

# Copy the whole directory of ActiveMQ into the image
COPY apache-activemq-6.2.0-SNAPSHOT /opt/apache-activemq-6.2.0-SNAPSHOT

# Set the working directory to the bin folder
WORKDIR /opt/apache-activemq-6.2.0-SNAPSHOT/bin

# Expose the required ports
EXPOSE 61616 8161

# Ensure correct execution permissions for scripts
RUN chmod +x /opt/apache-activemq-6.2.0-SNAPSHOT/bin/activemq

# Start up the ActiveMQ server
ENTRYPOINT ["sh", "-c", "./activemq console"]
