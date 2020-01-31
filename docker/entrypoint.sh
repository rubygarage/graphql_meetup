#!/usr/bin/env bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /var/www/graphql_meetup/tmp/pids/server.pid

bundle check || bundle install

bin/rails db:create db:migrate

exec "$@"
