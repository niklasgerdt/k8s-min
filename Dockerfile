FROM rust:slim-trixie AS build
WORKDIR /app
COPY rust/ /app
CMD cargo build

FROM gcr.io/distroless/base:debug
COPY --from=build /app/target/debug/core /bin
