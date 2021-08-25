FROM rossmurr4y/rust-builder-base AS builder

ARG CRATE="mdbook"
ARG VERSION="0.4.7"

RUN cargo install ${CRATE} --vers ${VERSION} --verbose