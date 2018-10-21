#!/bin/bash

set -x
# output log of userdata to /var/log/user-data.log
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

if [ -x "$(command -v docker)" ]; then
    echo "Docker already installed"
    # Check if docker is running else start
    pgrep -f docker >> /dev/null || service docker start
else
	# Install Docker and start docker daemon
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	apt-get update
	apt-get install -y docker-ce
	service docker restart
fi

# Pull latest version of docker-app
docker pull ajeetkhan/docker-app:1.0.3

# Run docker-app
docker run -d --restart=unless-stopped -p 80:5000 -v /var/run/docker.sock:/var/run/docker.sock  ajeetkhan/docker-app:1.0.3

# Add ubuntu to docker group
gpasswd -a ubuntu docker