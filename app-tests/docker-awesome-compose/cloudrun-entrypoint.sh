#!/bin/bash
set -e

echo "This is the Cloud Run entrypoint which sets up the environment for the Rails application in DEV mode."
echo "🏃🏻 RAILS_ENV=$RAILS_ENV"
echo "🏃🏻 PORT=$PORT"

# Create the database if it doesn't exist
bundle exec rails db:create

# Run the migrations
bundle exec rails db:migrate

# Seed the database (use with caution, should be idempotent)
bundle exec rails db:seed

echo "Riccardo, I hardcoded port and command abd everything as there's a bug on protobuf parsing. Once fixed, please restore the exec @"
# Then exec the container's main process (what's set as CMD in the Dockerfile).
#exec "$@"
exec rails server -p '8080' -b '0.0.0.0'  # lets try changing order...
