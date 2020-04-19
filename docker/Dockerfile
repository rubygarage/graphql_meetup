ARG RUBY_VERSION

FROM ruby:$RUBY_VERSION-buster

ARG PG_MAJOR
ARG NODE_MAJOR
ARG BUNDLER_VERSION
ARG YARN_VERSION

# Add PostgreSQL to sources list
RUN curl -sSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && echo 'deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main' $PG_MAJOR > /etc/apt/sources.list.d/pgdg.list

# Update system
RUN apt-get update -qq; apt-get upgrade -yq

# Install required packages
RUN apt-get install -yq --no-install-recommends \
                         build-essential \
                         postgresql-client-$PG_MAJOR

# Clear apt cache
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    truncate -s 0 /var/log/*log

# Set env variables
ENV RAILS_ROOT /var/www/graphql_meetup
ENV LANG=C.UTF-8 \
    GEM_HOME=$RAILS_ROOT/vendor/bundle \
    BUNDLE_JOBS=20 \
    BUNDLE_RETRY=5

# That allows us to run rails, rake, rspec andother
# binstubbed commands without prefixing them with bundle exec.
ENV BUNDLE_PATH $GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH \
  BUNDLE_BIN=$BUNDLE_PATH/bin
ENV PATH /app/bin:$BUNDLE_BIN:$PATH

# Update rubygems and install bundler
RUN gem update --system; gem install bundler:$BUNDLER_VERSION

# Create app dir
RUN mkdir -p $RAILS_ROOT/tmp/pids

WORKDIR $RAILS_ROOT

COPY Gemfile* ./

RUN bundle install --jobs $BUNDLE_JOBS --retry $BUNDLE_RETRY --path $BUNDLE_PATH

COPY . .
