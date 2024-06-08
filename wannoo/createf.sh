#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <feature_name>"
    exit 1
fi

feature_name=$1

mkdir -p "$feature_name"/{datalayer/{model/{request,response},service,repository,usecase},presentationlayer}