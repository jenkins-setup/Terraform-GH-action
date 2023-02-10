#!/bin/bash

desc=$(curl https://api.github.com/repos/jenkins-setup/Terraform-GH-action/pulls/$PR_NUMBER | jq '.body')
echo $desc
