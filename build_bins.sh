#!/bin/bash
set -euo pipefail

# these images are pushed up purely to get the bins
# they are not intended to be individually used

# mdbook=0.4.15
CRATE_NAME="mdbook" CRATE_VER="0.4.15" bash -c 'docker buildx build --platform linux/amd64,linux/arm64/v8 --build-arg CRATE="$CRATE_NAME" --build-arg VERSION="$CRATE_VER" --tag rossmurr4y/"$CRATE_NAME"-bin:"${CRATE_VER}" --file builder/debian/Dockerfile --push .'
# mdbook-linkcheck=0.7.6
CRATE_NAME="mdbook-linkcheck" CRATE_VER="0.7.6" bash -c 'docker buildx build --platform linux/amd64,linux/arm64/v8 --build-arg CRATE="$CRATE_NAME" --build-arg VERSION="$CRATE_VER" --tag rossmurr4y/"$CRATE_NAME"-bin:"${CRATE_VER}" --file builder/debian/Dockerfile --push .'
# mdbook-mermaid=0.10.0
CRATE_NAME="mdbook-mermaid" CRATE_VER="0.10.0" bash -c 'docker buildx build --platform linux/amd64,linux/arm64/v8 --build-arg CRATE="$CRATE_NAME" --build-arg VERSION="$CRATE_VER" --tag rossmurr4y/"$CRATE_NAME"-bin:"${CRATE_VER}"  --file builder/debian/Dockerfile --push .'
# mdbook-toc=0.8.0
CRATE_NAME="mdbook-toc" CRATE_VER="0.8.0" bash -c 'docker buildx build --platform linux/amd64,linux/arm64/v8 --build-arg CRATE="$CRATE_NAME" --build-arg VERSION="$CRATE_VER" --tag rossmurr4y/"$CRATE_NAME"-bin:"${CRATE_VER}"  --file builder/debian/Dockerfile --push .'
# mdbook-plantuml=0.7.0
CRATE_NAME="mdbook-plantuml" CRATE_VER="0.7.0" bash -c 'docker buildx build --platform linux/amd64,linux/arm64/v8 --build-arg CRATE="$CRATE_NAME" --build-arg VERSION="$CRATE_VER" --tag rossmurr4y/"$CRATE_NAME"-bin:"${CRATE_VER}"  --file builder/debian/Dockerfile --push .'
# mdbook-open-on-gh=2.0.2
CRATE_NAME="mdbook-open-on-gh" CRATE_VER="2.0.2" bash -c 'docker buildx build --platform linux/amd64,linux/arm64/v8 --build-arg CRATE="$CRATE_NAME" --build-arg VERSION="$CRATE_VER" --tag rossmurr4y/"$CRATE_NAME"-bin:"${CRATE_VER}"  --file builder/debian/Dockerfile --push .'
# mdbook-graphviz=0.1.3
## currently not building
#CRATE_NAME="mdbook-graphviz" CRATE_VER="0.1.3" bash -c 'docker buildx build --platform linux/amd64,linux/arm64/v8 --build-arg CRATE="$CRATE_NAME" --build-arg VERSION="$CRATE_VER" --tag rossmurr4y/"$CRATE_NAME"-bin:"${CRATE_VER}"  --file builder/debian/Dockerfile --push .'
# mdbook-katex=0.2.10
CRATE_NAME="mdbook-katex" CRATE_VER="0.2.10" bash -c 'docker buildx build --platform linux/amd64,linux/arm64/v8 --build-arg CRATE="$CRATE_NAME" --build-arg VERSION="$CRATE_VER" --tag rossmurr4y/"$CRATE_NAME"-bin:"${CRATE_VER}"  --file builder/debian/Dockerfile --push .'