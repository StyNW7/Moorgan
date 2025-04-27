#!/bin/bash

# Fungsi: Inisialisasi submodule
function init() {
  echo "🔧 Initializing submodules..."
  git submodule update --init --recursive
}

# Fungsi: Update semua submodule
function update() {
  echo "📦 Updating submodules..."
  git submodule foreach git pull origin main
}

# Fungsi: Jalankan frontend
function frontend() {
  echo "🚀 Starting frontend..."
  cd moorgan-frontend || exit
  npm install
  npm run dev
  cd ..
}

# Fungsi: Jalankan backend
function backend() {
  echo "🚀 Starting backend..."
  cd moorgan-backend || exit
  npm install
  npm run dev
  echo "Open Drizzle Studio"
  npm run db:studio
  cd ..
}

# Fungsi: Jalankan AI server
function ai() {
  echo "🧠 Starting AI server..."
  cd moorgan-ai || exit
  cd ..
}

# Fungsi: Jalankan AI server
function iot() {
  echo "🧠 Starting IOT server..."
  cd moorgan-iot || exit
  cd ..
}

# Fungsi: Jalankan semua dev server
function dev() {
  frontend &
  backend &
  ai &
  iot
}

# Routing berdasarkan argumen
case "$1" in
  init)
    init
    ;;
  update)
    update
    ;;
  dev)
    dev
    ;;
  frontend)
    frontend
    ;;
  backend)
    backend
    ;;
  ai)
    ai
    ;;
  iot)
    iot
    ;;
  *)
    echo "❌ Unknown command: $1"
    echo "Usage: ./dev.sh [init|update|dev|frontend|backend|ai|iot]"
    ;;
esac
