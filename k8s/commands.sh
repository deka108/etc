#!/usr/bin/env bash

# Get Secrets with JSON Path
kubectl get secrets/[SECRET_NAME] -n [NAMESPACE] -o 'jsonpath={.data["JSON_PATH_TO_SECRET"]}' | base64 --decode

# Get Secrets with Go Template
kubectl get secrets/[SECRET_NAME] -n [NAMESPACE] -o 'go-template={{index .data "JSON_PATH_TO_SECRET"}}' | base64 --decode

replace_envvar () {
    echo "Substituting ${1}"
    tmpfile=${1%.yaml}.tmp.yaml
    envsubst < $1 > ${tmpfile} && mv ${tmpfile} $1
}

replace_envvar_tmp () {
    echo "Substituting ${1}"
    replaced_file=tmp/$1
    tmpfile=tmp/${1%.yaml}.tmp.yaml
    mkdir -p `dirname ${replaced_file}`
    mkdir -p `dirname ${tmpfile}`
    envsubst < $1 > ${tmpfile} && mv ${tmpfile} ${replaced_file}
}

replace_k8s_config() {
  echo "Substituting ConfigMap..."
  for file in `find config -name "*configmap.yaml" -type f`; do
      replace_envvar ${file}
  done

  echo "Substituting k8s Config..."
  for file in `find  k8s -name "*.yaml" -type f`; do
      replace_envvar ${file}
  done
}

