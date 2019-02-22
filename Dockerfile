FROM ruby:2.6.1-slim
MAINTAINER Jose Antonio Parra <josparbar@gmail.com>

# JS Runtime and pg dependencies
RUN apt-get -qy update && \
    apt-get -y install --no-install-recommends build-essential \
      curl gnupg2 ruby-dev libpq-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install newest version for Node
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV INSTALL_PATH /app

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY Gemfile* ./

RUN gem install bundler
RUN bundle install --jobs $(nproc) --retry 2 --binstubs

COPY . .

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
