#!/bin/bash

# builder base image
#docker buildx build \
#  --platform linux/amd64,linux/arm64/v8 \
#  --tag rossmurr4y/rust-builder-base:latest \
#  --file base/debian/Dockerfile \
#  --push .
  
# crate binary images
while IFS= read -r LINE; do

  CRATE_NAME=${LINE%=*};
  CRATE_VER=${LINE#*=};
  
  # capture mdbook version for final package version
  if [[ "$CRATE_NAME" == "mdbook" ]]; then
    export MDBOOK_VER="$CRATE_VER"
  fi
  docker buildx build \
    --platform linux/amd64,linux/arm64/v8 \
    --build-arg "CRATE=$CRATE_NAME" \
    --build-arg "VERSION=$CRATE_VER" \
    --tag "rossmurr4y/$CRATE_NAME-bin:$CRATE_VER" \
    --tag "rossmurr4y/$CRATE_NAME-bin:latest" \
    --file builder/debian/Dockerfile \
    --push . ;

done < <(grep -v '^ *#' < crates)

# release image
docker buildx build \
  --platform linux/amd64,linux/arm64/v8 \
  --tag "rossmurr4y/mdbook:$MDBOOK_VER" \
  --tag rossmurr4y/mdbook:latest \
  --file release/debian/Dockerfile \
  --push .
