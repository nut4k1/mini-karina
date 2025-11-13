FROM ruby:3.4.7-alpine AS builder

ARG PACKAGES="vim openssl-dev build-base curl less git bash screen imagemagick-jpeg imagemagick-webp imagemagick"

RUN apk update \
    && apk add --no-cache $PACKAGES

WORKDIR /mini-karina
COPY . /mini-karina

# YJIT
ENV RUBY_YJIT_ENABLE=1
