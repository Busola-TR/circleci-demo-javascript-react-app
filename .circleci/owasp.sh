#!/bin/bash

# mkdir owasp-folder
LATEST_VERSION=$(curl -s https://api.github.com/repos/jeremylong/DependencyCheck/releases/latest | jq -r .tag_name)

# Remove the 'v' prefix if it exists
VERSION_NUMBER=$(echo "$LATEST_VERSION" | sed 's/^v//')
wget https://github.com/jeremylong/DependencyCheck/releases/download/v$VERSION_NUMBER/dependency-check-$VERSION_NUMBER-release.zip
unzip dependency-check-$VERSION_NUMBER-release.zip


dependency-check/bin/dependency-check.sh -s . -d /owasp-folder

msg_commit=$(date +%H_%M_%d_%m_%Y)
suffix_file_name=$(head /dev/urandom | tr -dc 'A-Za-z0-9' | head -c 50)
