#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y 
sudo service apache2 start 
sudo apt install default-jre -y

sudo apt-get update -y
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y


curl -sO http://13.233.40.217:8080/jnlpJars/agent.jar
java -jar agent.jar -url http://13.233.40.217:8080/ -secret 3ade45bfa73d0e542d08997eed7e527499133f6d502e17935511bd73edf506d2 -name Test -workDir "/home/ubuntu/jenkins"
