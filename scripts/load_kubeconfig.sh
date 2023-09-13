#!/usr/bin/env zsh

DEFAULT_CONFIG="$HOME/.kube/config"

if test -f "$DEFAULT_CONFIG"
then
  export KUBECONFIG=$DEFAULT_CONFIG
fi

KUBECTL_CONFIG_FILES="$HOME/.kube/configs"

OIFS="$IFS"
IFS=$'\n'

for configFile in `find "$KUBECTL_CONFIG_FILES" -type f -name "*.yaml"`
do
  export KUBECONFIG="$configFile:$KUBECONFIG"
done
IFS="$OIFS"