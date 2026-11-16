# Development image for the Rails API.
# Ruby and Rails live in the image, so no local Ruby install is needed.
FROM ruby:3.3-slim

RUN apt-get update -qq \
 && apt-get install -y --no-install-recommends build-essential libpq-dev libyaml-dev git curl \
 && rm -rf /var/lib/apt/lists/*

# Lets you run `rails new` inside the container before the app exists.
RUN gem install rails

WORKDIR /app

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]
