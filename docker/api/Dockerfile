FROM ruby:3.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev && rm -rf /var/lib/apt/lists/*

ENV APP_ROOT /app
WORKDIR $APP_ROOT

COPY Gemfile* $APP_ROOT
RUN bundle install

COPY . /app
