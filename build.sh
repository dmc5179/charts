#!/bin/bash

for chart in "$@"
do
  operator-sdk new "${chart}-operator" --type=helm --helm-chart ../stable/${chart}
  pushd "${chart}-operator"
  operator-sdk build --image-builder docker quay.io/danclark/${chart}-operator:v0.0.1
  popd
done

