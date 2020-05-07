#!/bin/bash
# Install Kubernetes Tools
# https://github.com/ArtiomL/aws-labs
# Artiom Lichtenstein
# v1.3, 07/05/2020

# Install kubectl
sudo curl --silent --location -o /usr/local/bin/kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.15.10/2020-02-22/bin/linux/amd64/kubectl
sudo chmod +x /usr/local/bin/kubectl

# Update awscli
sudo pip install --upgrade awscli && hash -r

# Install jq, envsubst (from GNU gettext utilities) and bash-completion
sudo yum -y install jq gettext bash-completion

# Enable kubectl bash_completion
kubectl completion bash >>  ~/.bash_completion
. /etc/profile.d/bash_completion.sh
. ~/.bash_completion

# Install terraform
wget -O terraform.zip https://releases.hashicorp.com/terraform/0.12.19/terraform_0.12.19_linux_amd64.zip
unzip terraform.zip
rm terraform.zip
sudo mv terraform /usr/local/bin/

# Verify the binaries are in path
for command in kubectl jq envsubst aws terraform
  do
    which $command &>/dev/null && echo "$command in path" || echo "$command NOT FOUND"
  done