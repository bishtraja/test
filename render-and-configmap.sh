#!/usr/bin/env bash
set -eu -o pipefail

error() {
    >&2 echo "ERROR:" "${@}"
    exit 1
}

[ $# = 1 ] || error "Usage: $(basename "${0}") JSONNET_FILE_OF_DASHBOARD"
dashboard_jsonnet_file="${1}"

rendered_json_file="/tmp/$(basename "${dashboard_jsonnet_file%.jsonnet}").rendered.json"

# Render
JSONNET_PATH="$(realpath vendor)"
export JSONNET_PATH
jsonnet -o "${rendered_json_file}" "${dashboard_jsonnet_file}"

# Generate a unique name for the ConfigMap
configmap_name="dashboard-$(date +%s)"

# Create the ConfigMap
kubectl create configmap "${configmap_name}" \
    --from-file="$(basename "${dashboard_jsonnet_file%.jsonnet}").json"="${rendered_json_file}" \
    --dry-run=client -o json \
    | jq '.metadata.labels["collect-me"]="grafana-dashboard"'
