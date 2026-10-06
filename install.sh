#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${HOME}/.local/bin"

mkdir -p "$BIN_DIR"
ln -sf "$SCRIPT_DIR/multiagy" "$BIN_DIR/multiagy"
chmod +x "$SCRIPT_DIR/multiagy"

echo "✓ multiagy installato con successo in $BIN_DIR/multiagy"
if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    echo "⚠️  Nota: Assicurati che $BIN_DIR sia presente nel tuo PATH."
fi
