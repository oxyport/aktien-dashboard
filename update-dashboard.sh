#!/usr/bin/env bash
# Aktualisiert das oeffentliche Dashboard mit der neuesten index.html aus dem
# privaten Repo und pusht die Aenderung. Aufruf:  ./update-dashboard.sh
set -euo pipefail

SRC="/Users/nils/Documents/GitHub/aktien-watchlist/docs/index.html"
DST_DIR="$(cd "$(dirname "$0")" && pwd)"

cp "$SRC" "$DST_DIR/index.html"
cd "$DST_DIR"

if git diff --quiet; then
  echo "Keine Aenderung – Dashboard ist bereits aktuell."
  exit 0
fi

git add index.html
git commit -m "Dashboard aktualisieren"
git push
echo "✓ Dashboard aktualisiert und gepusht."
