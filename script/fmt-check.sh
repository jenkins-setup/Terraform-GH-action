#!/bin/sh

RET=0

if [ $(terraform fmt -check=true) ]
then
    echo "Terraform fmt Check Failed. formatting required"
    echo $(terraform fmt -check=true) 
    RET=1    
else
    echo "Terraform fmt Check pass"
fi

exit $RET