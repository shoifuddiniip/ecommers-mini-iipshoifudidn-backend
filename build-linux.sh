#!/bin/bash
# Build Go backend for Linux (Ubuntu) x64 from Windows or Linux

set -e  # Exit on first error

echo "Building Go backend for Linux x64..."
export GOOS=linux
export GOARCH=amd64
export GO111MODULE=on
export PORT=8000

# Ensure build folder exists
mkdir -p build/ecommerce

# Compile
go build -o build/ecommerce/ecommerce *.go

echo "✅ Build complete: build/ecommerce/ecommerce"
echo "Copy this file to your Ubuntu server and run: chmod +x ecommerce && ./ecommerce"
