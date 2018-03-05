#!/bin/bash

github_url="https://api.github.com/repos/BinaryBeard/xwingjson"
user="BinaryBeard:ba02c518c427c3832a56ec58b2dc40e4949b44d7"

download_urls=($(curl -u ${user} -s ${github_url}/releases/latest | jq --raw-output '.assets[] | .browser_download_url'))
version=$(echo ${download_urls} | grep -oE 'v\d\.\d\.\d')
echo "Version: ${version}"

for url in "${download_urls[@]}"; do
    if [[ $url = *"en.all.json.zip"* ]]; then
        echo "Found all english json file!"
    fi
done
