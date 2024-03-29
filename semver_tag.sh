#!/bin/bash

desc=$(curl https://api.github.com/repos/jenkins-setup/Terraform-GH-action/pulls/$PR_NUMBER | jq '.body')

if [[ $desc =~ .*"[x] Major".* ]]
    then
        type="major"
    elif [[ $desc =~ .*"[x] Minor".* ]]
    then
        type="minor"
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
