#!/bin/sh

set -e

KOPF_REFRESH_RATE="${KOPF_REFRESH_RATE:-5000}"
KOPF_THEME="${KOPF_THEME:-dark}"
KOPF_WITH_CREDENTIALS="${KOPF_WITH_CREDENTIALS:-false}"
KOPF_ES_ROOT_PATH="${KOPF_ES_ROOT_PATH:-/es}"

cat <<EOF > /var/www/html/kopf_external_settings.json
{
    "elasticsearch_root_path": "${KOPF_ES_ROOT_PATH}",
    "with_credentials": ${KOPF_WITH_CREDENTIALS},
    "theme": "${KOPF_THEME}",
    "refresh_rate": ${KOPF_REFRESH_RATE}
}
EOF

rm -rf /run/httpd/* /tmp/httpd*

exec /usr/sbin/apachectl -DFOREGROUND
