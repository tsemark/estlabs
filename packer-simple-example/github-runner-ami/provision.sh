#!/bin/bash

set -euxo pipefail

GH_RUNNER_AGENT_VERSION="2.319.1"
GITVERSION_VERSION="6.0.0-rc.2"
KUBECTL_VERSION="v1.31.0"

apt-get update

# Install dependencies
apt-get install -y libssl-dev zlib1g libkrb5-3 libicu70 unzip ca-certificates curl

# Since awscli version in Ubuntu is too old, we should switch to this instead
curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
# Install docker-ce
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin gh

# Install kuztomize
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
mv kustomize /usr/bin/


# DOCKERD PERMISSION
usermod -aG docker ubuntu

# INSTALL RUNNER AGENT
mkdir /opt/action-runner && cd /opt/action-runner
curl -o "action-runner-linux-arm64-${GH_RUNNER_AGENT_VERSION}.tar.gz" -L "https://github.com/actions/runner/releases/download/v${GH_RUNNER_AGENT_VERSION}/actions-runner-linux-arm64-${GH_RUNNER_AGENT_VERSION}.tar.gz"
tar xzf "./action-runner-linux-arm64-${GH_RUNNER_AGENT_VERSION}.tar.gz"
chown -R ubuntu:ubuntu /opt/action-runner
chmod 755 /opt/action-runner