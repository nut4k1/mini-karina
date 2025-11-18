from alpine:latest as mini-karina-modules

RUN apk add wget unzip
RUN wget "https://github.com/nut4k1/mini-karina-modules/raw/refs/heads/main/galactic_cruise.zip" -O "galactic_cruise.zip"
RUN unzip galactic_cruise.zip -d /mini-karina-modules/

FROM ruby:3.4.7-alpine AS builder
ARG PACKAGES="vim openssl-dev build-base curl less git bash screen imagemagick-jpeg imagemagick-webp imagemagick wget unzip"

RUN apk update \
    && apk add --no-cache $PACKAGES

ENV BUNDLE_PATH=/bundle_cache \
    BUNDLE_APP_CONFIG=/bundle_cache \
    BUNDLE_BIN=/bundle_cache/bin \
    PATH="/bundle_cache/bin:${PATH}"

RUN mkdir -p /bundle_cache

WORKDIR /mini-karina

COPY Gemfile Gemfile.lock ./

RUN bundle config set --local path /bundle_cache \
    && bundle install --jobs 4 --retry 3

COPY . /mini-karina
COPY --from=mini-karina-modules /mini-karina-modules /mini-karina-modules

# YJIT
ENV RUBY_YJIT_ENABLE=1
