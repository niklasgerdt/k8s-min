FROM rust:slim-trixie AS build
WORKDIR /app
COPY rust/ /app
CMD ["cargo build"]

FROM gcr.io/distroless/cc-debian12
COPY --from=build /app/target/debug/core /
CMD ["/core"]
