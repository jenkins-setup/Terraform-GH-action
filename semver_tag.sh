#!/bin/bash

desc=$(curl https://api.github.com/repos/jenkins-setup/Terraform-GH-action/pulls/39 | jq '.body')
echo $desc
