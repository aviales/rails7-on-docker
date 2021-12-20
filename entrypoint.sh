#!/bin/bash

# HEY YOU! check for help in the terminal to learn what is doing this command
# HINT $ set [magic words]
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /usr/src/app/tmp/pids/server.pid

# budnel check verifies if dependencies are satisfied by installed gems
# The --jobs option (-j for short) installs gems in parallel
echo "bundle install..."
bundle check || bundle install --jobs 4

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
