FROM ruby:alpine3.16

RUN apk update && apk add --no-cache build-base git

WORKDIR /app/

COPY Gemfile* /app/

RUN bundle install

ENTRYPOINT ["bundle", "exec", "jekyll", "serve"]