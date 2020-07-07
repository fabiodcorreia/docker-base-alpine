#!/bin/bash

IMAGE_NAME="base-alpine"

docker build . -t ${IMAGE_NAME}
docker run --rm --entrypoint '/bin/sh' -v ${PWD}:/tmp ${IMAGE_NAME} -c '\
  apk info -v | sort > /tmp/package_versions.txt && \
  chmod 777 /tmp/package_versions.txt'
