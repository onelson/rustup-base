FROM debian:stretch

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    ca-certificates curl file \
    build-essential \
    libssl-dev \
    pkg-config \
    autoconf automake autotools-dev libtool xutils-dev && \
    rm -rf /var/lib/apt/lists/*

ARG RUST_TOOLCHAIN

RUN mkdir -p /rust/cargo /rust/rustup

ENV RUSTUP_HOME=/rust/rustup \
    CARGO_HOME=/rust/cargo

RUN curl https://sh.rustup.rs -sSf | sh -s -- \
  --default-toolchain $RUST_TOOLCHAIN --no-modify-path -y

ENV PATH=$CARGO_HOME/bin:$PATH

