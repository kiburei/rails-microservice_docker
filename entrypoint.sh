#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /fx_transactions_microservice/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
