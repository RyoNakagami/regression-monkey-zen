#!/bin/bash
# ------------------------------------------------
# zen_parser.sh
# Description:
#   Parse and display a Zen text file
# ------------------------------------------------
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <zen_text_file>" >&2
  exit 1
fi

ZEN_TEXT_FILE="$1"

if [ ! -f "$ZEN_TEXT_FILE" ]; then
  echo "Error: File '$ZEN_TEXT_FILE' not found." >&2
  exit 1
fi

echo
echo "🧘  The Way of $(basename "$ZEN_TEXT_FILE" .txt)"
echo "---------------------------------------------"
cat "$ZEN_TEXT_FILE" | grep -v '^#'
echo
