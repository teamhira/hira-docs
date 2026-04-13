#!/usr/bin/env bash

set -u

echo "[docs-check] Starting local docs validation..."

if command -v markdownlint >/dev/null 2>&1; then
  echo "[docs-check] Running markdownlint..."
  markdownlint "**/*.md"
else
  echo "[docs-check] markdownlint not found. Skip lint step."
fi

if command -v lychee >/dev/null 2>&1; then
  echo "[docs-check] Running link check (lychee)..."
  lychee --no-progress --exclude-mail "**/*.md"
else
  echo "[docs-check] lychee not found. Skip link check step."
fi

echo "[docs-check] Done."
