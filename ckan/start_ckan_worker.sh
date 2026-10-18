#!/bin/bash
set -euo pipefail

python3 /srv/app/prerun.py

token_file="${CKAN_STORAGE_PATH}/xloader-api-token"
if [[ ! -s "$token_file" ]]; then
    echo "XLoader API token is missing: $token_file" >&2
    exit 1
fi

ckan config-tool "$CKAN_INI" \
    "ckanext.xloader.api_token=$(<"$token_file")"

exec ckan -c "$CKAN_INI" jobs worker
