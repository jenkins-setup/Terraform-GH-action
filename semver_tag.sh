#!/bin/bash

desc=$(curl https://api.github.com/repos/jenkins-setup/Terraform-GH-action/pulls/39 | jq '.body')

if [[ $desc =~ .*"[x] Minor".* ]]
    then
        type="minor"
    elif [[ $desc =~ .*"[x] Major".* ]]
    then
        type="major"
    else
        type="patch"
    fi

var=$(git fetch -t > /dev/null 2>&1 && git tag --sort=-v:refname | head -1)

IFS=. read -r major minor patch <<EOF
$var
EOF

case "$type" in
major) 
    tag="$((major+1)).0.0";
    ;;

minor)
    tag="$major.$((minor+1)).0";
    ;;

*)
    tag="$major.$minor.$((patch+1))";
    ;;
esac

echo "$tag"
