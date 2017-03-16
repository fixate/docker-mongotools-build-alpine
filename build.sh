#!/usr/bin/env bash
set -e

script_dir="$(pwd "$0")"

echo "Building image..."
docker build -t docker-mongodump-build-alpine .

echo "Running container and building mongodump"
mkdir -p bin
docker run --rm -v $script_dir/bin:/target docker-mongodump-build-alpine