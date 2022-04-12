#!/bin/bash
set -e

source release/source.sh

docker buildx rm protocurl-builder || true
docker buildx create --use --name protocurl-builder

# todo. this does not work currently on GitHub Actions
# ,linux/arm64

docker buildx build \
  --platform linux/amd64,linux/i386 \
  --build-arg VERSION=$VERSION \
  -t qaware/protocurl:$VERSION -f release/Dockerfile \
  --push .
