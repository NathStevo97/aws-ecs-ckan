#!/bin/bash
set -e

token_file="${CKAN_STORAGE_PATH}/xloader-api-token"
if [[ ! -s "$token_file" ]]; then
    ckan -c "$CKAN_INI" user token add "$CKAN_SYSADMIN_NAME" xloader -q \
        | tail -n 1 | tr -d '\t' > "$token_file"
fi

ckan config-tool "$CKAN_INI" \
    "ckanext.xloader.api_token=$(<"$token_file")"
