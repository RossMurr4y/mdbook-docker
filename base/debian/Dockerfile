FROM rust:1.54.0-slim-bullseye AS base

RUN apt-get update --allow-insecure-repositories; \
    apt-get install -y \
        g++-arm-linux-gnueabihf \
        gcc-arm-linux-gnueabihf \
        binutils-arm-linux-gnueabihf \
        libc6-dev-arm64-cross \
        libssl-dev \
        pkg-config \
        ca-certificates \
        build-essential \
        make \
        perl \
        gcc \
        libc6-dev; \
    dpkgArch="$(dpkg --print-architecture)"; \
    echo "Arch: ${dpkgArch}"; \
    case "${dpkgArch##*-}" in \
        amd64) rustArch='x86_64-unknown-linux-gnu' ;; \
        armhf) rustArch='armv7-unknown-linux-gnueabihf' ;; \
        arm64) rustArch='aarch64-unknown-linux-gnu' ;; \
        i386) rustArch='i686-unknown-linux-gnu' ;; \
        *) echo >&2 "unsupported architecture: ${dpkgArch}"; exit 1 ;; \
    esac; \
    echo "Setting cargo default arch to: ${rustArch}"; \
    rustup set default-host ${rustArch};