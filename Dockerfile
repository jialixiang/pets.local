FROM ruby:2.5.1

MAINTAINER Amanda Xiang <amanda.jiali.xiang@gmail.com>

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
&& apt-get install -y nodejs

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn

RUN mkdir /pets.local
WORKDIR /pets.local

COPY . .
COPY Gemfile /pets.local/Gemfile
COPY Gemfile.lock /pets.local/Gemfile.lock

RUN bundle install

COPY . /pets.local

EXPOSE 5432
