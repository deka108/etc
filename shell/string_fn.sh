#!/usr/bin/env bash

# extract the file name
s=Successfully packaged chart and saved it to: /Users/user/Projects/Folder/some-helm-charts/achart-0.1.0.tgz
echo $s | rev | cut -d " " -f1 | cut -d "/" -f1 | rev
