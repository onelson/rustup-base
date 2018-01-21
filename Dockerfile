FROM debian:stretch

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    ca-certificates curl file \
    build-essential \
    autoconf automake autotools-dev libtool xutils-dev && \
    rm -rf /var/lib/apt/lists/*

ENV SSL_VERSION=1.0.2l \
    OPENSSL_LIB_DIR=/usr/local/ssl/lib \
    OPENSSL_INCLUDE_DIR=/usr/local/ssl/include \
    OPENSSL_STATIC=1

RUN curl https://www.openssl.org/source/openssl-$SSL_VERSION.tar.gz -O && \
    tar -xzf openssl-$SSL_VERSION.tar.gz && \
    cd openssl-$SSL_VERSION && ./config && make depend && make install && \
    cd .. && rm -rf openssl-$SSL_VERSION*

ARG RUST_TOOLCHAIN

RUN mkdir -p /rust/cargo /rust/rustup

ENV RUSTUP_HOME=/rust/rustup \
    CARGO_HOME=/rust/cargo

RUN curl https://sh.rustup.rs -sSf | sh -s -- \
  --default-toolchain $RUST_TOOLCHAIN --no-modify-path -y

ENV PATH=$CARGO_HOME/bin:$PATH

