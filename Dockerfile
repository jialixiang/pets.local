FROM ruby:2.5.1-slim

MAINTAINER Amanda Xiang <amanda.jiali.xiang@gmail.com>

RUN apt-get update && apt-get install -qq -y build-essential libpq-dev nodejs --fix-missing --no-install-recommends

RUN mkdir /pets.local
WORKDIR /pets.local
COPY . .
COPY Gemfile /pets.local/Gemfile
COPY Gemfile.lock /pets.local/Gemfile.lock

RUN bundle install
COPY . /pets.local
