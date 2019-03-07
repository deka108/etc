#!/usr/bin/env bash

# Get Secrets with JSON Path
kubectl get secrets/[SECRET_NAME] -n [NAMESPACE] -o 'jsonpath={.data["JSON_PATH_TO_SECRET"]}' | base64 --decode

# Get Secrets with Go Template
kubectl get secrets/[SECRET_NAME] -n [NAMESPACE] -o 'go-template={{index .data "JSON_PATH_TO_SECRET"}}' | base64 --decode