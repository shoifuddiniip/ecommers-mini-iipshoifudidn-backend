#!/bin/bash

# Hentikan eksekusi jika ada error
set -e

APP_NAME="myapp.exe"
PORT=8000

echo "[1/4] 🧹 Membersihkan binary lama..."
if [ -f "$APP_NAME" ]; then
    echo "   ➜ Menghapus $APP_NAME lama"
    rm -f "$APP_NAME"
fi

echo "[2/4] 🔍 Memeriksa dependensi..."
go mod tidy

echo "[3/4] 🏗️  Membuild aplikasi..."
go build -o "$APP_NAME" *.go

echo "[4/4] 🚀 Menjalankan aplikasi di port $PORT..."
./"$APP_NAME"
