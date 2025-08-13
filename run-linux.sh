#!/bin/bash
# Script to build Go backend and run from build folder

echo "Building backend..."
export GO111MODULE=on
export PORT=8000

go build -o build/ecommerce/ecommerce main.go

cd build/ecommerce
./ecommerce
