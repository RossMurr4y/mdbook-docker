#!/bin/bash
set -euo pipefail

docker pull rossmurr4y/mdbook-bin:latest
docker pull rossmurr4y/mdbook-linkcheck-bin:latest
docker pull rossmurr4y/mdbook-mermaid-bin:latest
docker pull rossmurr4y/mdbook-toc-bin:latest
docker pull rossmurr4y/mdbook-plantuml-bin:latest
docker pull rossmurr4y/mdbook-open-on-gh-bin:latest
docker pull rossmurr4y/mdbook-katex-bin:latest
docker pull rossmurr4y/mdbook-docx-bin:latest

# re-authentication to dockerhub incase of timeout
docker login 

# builds and publishes the latest mdbook-slim image
# containing mdbook + plugins that do not have dependancies
docker buildx build \
  --target mdbook-slim \
  --platform linux/amd64,linux/arm64/v8 \
  --tag "rossmurr4y/mdbook-debian-slim:0.4.18" \
  --tag "rossmurr4y/mdbook-debian-slim:latest" \
  --file release/debian/Dockerfile \
  --pull \
  --push .

# re-authentication to dockerhub incase of timeout
docker login 

# builds the full mdbook image using their latest bins
# release image
docker buildx build \
  --platform linux/amd64,linux/arm64/v8 \
  --tag "rossmurr4y/mdbook-debian:0.4.18" \
  --tag "rossmurr4y/mdbook-debian:latest" \
  --tag "rossmurr4y/mdbook:0.4.18" \
  --tag "rossmurr4y/mdbook:latest" \
  --file release/debian/Dockerfile \
  --pull \
  --push .
