ARG RUBY_VERSION=3.4.5
FROM docker.io/library/ruby:$RUBY_VERSION-slim

WORKDIR /app

RUN apt-get update -qq && apt-get install -y build-essential nodejs postgresql-client libyaml-dev libpq-dev

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs $(nproc) --retry 3

COPY . .

RUN bundle exec rails assets:precompile

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
COPY cloudrun-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/cloudrun-entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 8080

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8080"]
