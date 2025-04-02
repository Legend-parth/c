#!/bin/bash

# Ensure the script is executable
chmod +x /root/start.sh

# Start the Docker daemon
dockerd &

# Wait for Docker to start
while ! docker info > /dev/null 2>&1; do
  echo "Waiting for Docker to start..."
  sleep 1
done

# Run a simple Nginx container
docker run -d -p 80:80 nginx

# Set up the SSH tunnel using sshx.io
# Replace the placeholders with your actual sshx.io credentials and port
sshx -R 5000:localhost:80 user@sshx.io -p 62409

# Keep the script running
tail -f /dev/null
