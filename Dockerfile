FROM rust:slim-trixie AS build
WORKDIR /app
COPY . /app
CMD rustc /app/src/main.rs

FROM gcr.io/distroless/base:debug
COPY --from=build /app/main /bin
