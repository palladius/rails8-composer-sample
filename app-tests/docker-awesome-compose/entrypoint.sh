#!/bin/bash
set -e

echo "Riccardo I fixed the cloud run from 3000 to 8080. Theres a change the normal flow is now broken."

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
