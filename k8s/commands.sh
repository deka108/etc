#!/usr/bin/env bash

# Get Secrets
kubectl get secrets/[SECRET_NAME] -n [NAMESPACE] -o json | jq -r '.["JSON_PATH_TO_SECRET"]' | base64 --decode
