FROM ruby:2.6

LABEL maintainer="ianfleeton@gmail.com"

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs

RUN gem install bundler:2.0.1 --no-doc

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install

COPY . /usr/src/app/

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
