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

# builds the latest mdbook using their latest bins
# release image
docker buildx build \
  --platform linux/amd64,linux/arm64/v8 \
  --tag "rossmurr4y/mdbook:0.4.15" \
  --tag rossmurr4y/mdbook:latest \
  --file release/debian/Dockerfile \
  --pull \
  --push .
