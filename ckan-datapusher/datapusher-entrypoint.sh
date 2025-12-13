#!/bin/bash

DIR="/usr/lib/ckan/datapusher/src/datapusher"
CONF_FILE="${DIR}/deployment/datapusher_settings.py"
CONF_TMPL="${CONF_FILE}.unconfigured"
envsubst < $CONF_TMPL > $CONF_FILE

exec "$@"
