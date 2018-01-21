# Rustup Base

This is a debian image with some basic toolchain stuff in place, common to 
most of my rust dev environments.

It builds openssl, and installs rustup with a default toolchain of your 
choice via the `RUST_TOOLCHAIN` build arg.

All the rust toolchain stuff is installed under `/rust` to make ownership 
easy to transfer to a different user later.

