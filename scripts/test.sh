#!/bin/bash

github_url="https://api.github.com/repos/BinaryBeard/xwingjson"

download_urls=($(curl -s ${github_url}/releases/latest | jq --raw-output '.assets[] | .browser_download_url'))
version=$(echo ${download_urls} | grep -oE 'v\d\.\d\.\d')
echo "Version: ${version}"

for url in "${download_urls[@]}"; do
    if [[ $url = *"en.all.json.zip"* ]]; then
        echo "Found all english json file!"
    fi
done
