FROM ruby:alpine3.17

RUN apk update && apk add --no-cache build-base git curl

WORKDIR /app/

COPY Gemfile* /app/

RUN bundle install

RUN git config --global --add safe.directory '*'

HEALTHCHECK --start-period=10s \
    CMD curl http://127.0.0.1:4000/ || exit 1

ENTRYPOINT ["bundle", "exec", "jekyll", "serve"]
