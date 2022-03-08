#!/bin/bash
set -euo pipefail

# builds a fresh builder-base with the latest deps

docker buildx build \
  --platform linux/amd64,linux/arm64/v8 \
  --tag rossmurr4y/rust-builder-base:latest \
  --file base/debian/Dockerfile \
  --push .