#!/bin/bash

    if [[ ! -z $( git show -s | awk '{print tolower($0)}' | grep "minor") ]]
    then
        type="minor"
    elif [[ ! -z $( git show -s | awk '{print tolower($0)}' | grep "major") ]]
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
