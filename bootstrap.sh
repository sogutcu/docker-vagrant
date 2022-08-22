#!/bin/bash

echo "[TASK 1] Install Prerequisite Packages"
sudo apt install -qq -y apt-transport-https ca-certificates curl software-properties-common >/dev/null 2>&1

echo "[TASK 2] Import Docker GPG Key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "[TASK 3] Install Docker"
sudo apt update -qq >/dev/null 2>&1
sudo apt install -qq -y docker-ce >/dev/null 2>&1

echo "[TASK 4] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
192.168.56.200   docker.example.com     docker
EOF
