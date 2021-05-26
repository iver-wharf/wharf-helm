#!/usr/bin/env bash
set -euo pipefail

: ${KUBERNETES_VERSION:=${1:?"Kubernetes version must be passed as first argument or as environment variable KUBERNETES_VERSION"}}
: ${KUBEVAL_VERSION:="0.16.1"}
: ${SCHEMA_LOCATION:="https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/"}

GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
CHART_DIRS="$(git diff --find-renames --name-only "$GIT_BRANCH" remotes/origin/master -- charts | grep '[cC]hart.yaml' | sed -e 's#/[Cc]hart.yaml##g')"

# install kubeval
curl --silent --show-error --fail --location \
	--output /tmp/kubeval.tar.gz \
	"https://github.com/instrumenta/kubeval/releases/download/v${KUBEVAL_VERSION}/kubeval-linux-amd64.tar.gz"

tar -xf /tmp/kubeval.tar.gz kubeval

# validate charts
for CHART_DIR in ${CHART_DIRS}; do
  helm template "${CHART_DIR}" \
		| ./kubeval --strict --ignore-missing-schemas --kubernetes-version "${KUBERNETES_VERSION#v}" --schema-location "${SCHEMA_LOCATION}"
done
