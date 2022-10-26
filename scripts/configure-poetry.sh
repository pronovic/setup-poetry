#!/bin/bash
# vim: set ft=bash ts=2 sw=2:
# Configure Poetry

# For Windows, we always use installer.parallel=false.  I've repeatedly run into
# problems with the GHA Windows runners that appear to be related to the parallel
# installer, like:
#
#   ERROR: Could not install packages due to an OSError: [WinError 32] The process cannot access the file because it is being used by another process: 'C:\\Users\\RUNNER~1\\AppData\\Local\\Temp\\tmpwryrq954_in_process.py'
#
# Hopefully, setting installer.parallel=false will lead to more stability.

set -e

echo "Setting cache-dir=$POETRY_CACHE"
poetry config cache-dir "$POETRY_CACHE"

echo "Setting virtualenvs.create=true"
poetry config virtualenvs.create true

echo "Setting virtualenvs.in-project=true"
poetry config virtualenvs.in-project true

if [ ! -z "$MAX_WORKERS" ]; then
  echo "Setting MAX_WORKERS=$MAX_WORKERS"
  poetry config installer.max-workers "$MAX_WORKERS"
fi

poetry config --list

