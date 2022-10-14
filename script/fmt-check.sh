#!/bin/sh

RET=0

for i in $(git rev-list "$1".."$2" )
do
    printf "check Terraform fmt "
    echo "$1"
    echo "another repo name is: "
    echo "$2"
done
exit $RET
