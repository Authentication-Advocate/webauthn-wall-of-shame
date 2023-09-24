FROM ruby:alpine3.17

RUN apk update && apk add --no-cache build-base git

WORKDIR /app/

COPY Gemfile* /app/

RUN bundle install

RUN git config --global --add safe.directory '*'

ENTRYPOINT ["bundle", "exec", "jekyll", "serve"]
