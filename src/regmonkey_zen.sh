#!/bin/bash
# ------------------------------------------------
# Author: Ryo Nakagami
# Revised: 2025-10-20
# Description:
#   Regmonkey Zen Launcher
#
#   This script lists all available Zen documents 
#   (.txt and .py) under the 'zen_docs' directory, 
#   prompts the user to select one, and displays it.
#
#   Features:
#     - Sorted list of Zens (case-insensitive)
#     - Supports .txt (parsed via zen_parser.sh)
#       and .py (executed directly) files
#     - Optional paging via less with -p flag
#
# Usage:
#   ./regmonkey_zen.sh           # Normal display
#   ./regmonkey_zen.sh -p        # Display output through less
#   ./regmonkey_zen.sh -l jp     # Display Japanese Zen
#
# Options:
#   -p    Pipe output through less for scrolling
# ------------------------------------------------
set -euo pipefail

# Enable nullglob so globs that don't match disappear
shopt -s nullglob

# Directories and files
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZEN_DOCS_DIR="${SCRIPT_DIR}/zen_docs"
ZEN_PARSER="${SCRIPT_DIR}/utils/zen_parser.sh"

# Default: no pager
USE_LESS=false
LANGUAGE="en"  # en: english, default, jp: 日本語

# parse options
while getopts ":l:p" opt; do
  case $opt in
    l)
      # -l: setup language
      LANGUAGE="$OPTARG"
      ;;
    p)
      # -p: setup pager
      USE_LESS=true
      ;;
    :)
      # without argument
      echo "Option -$OPTARG requires an argument (en or jp)." >&2
      exit 1
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Zen directory
if [ "$LANGUAGE" == "en" ]; then
  ZEN_DOCS_DIR="${SCRIPT_DIR}/zen_docs/"
else
  ZEN_DOCS_DIR="${SCRIPT_DIR}/zen_docs/${LANGUAGE}"
fi



# Check prerequisites
if [ ! -d "$ZEN_DOCS_DIR" ]; then
  echo "Error: zen_docs directory not found." >&2
  exit 1
fi

if [ ! -x "$ZEN_PARSER" ]; then
  echo "Error: zen_parser.sh not found or not executable." >&2
  exit 1
fi

# Gather available Zens
ZEN_FILES=("$ZEN_DOCS_DIR"/*.{txt,py})

# Sort files alphabetically (case-insensitive)
IFS=$'\n' ZEN_FILES=($(printf "%s\n" "${ZEN_FILES[@]}" | sort -f))
unset IFS

if [ ${#ZEN_FILES[@]} -eq 0 ]; then
  echo "No zen text files found in $ZEN_DOCS_DIR." >&2
  exit 0
fi

echo "Available Zens:"
echo "---------------"
i=1
for file in "${ZEN_FILES[@]}"; do
  printf "%2d. %s\n" "$i" "$(basename "$file" .txt)"
  ((i++))
done

echo
read -rp "Select a zen number to view: " choice

# Validate user input
if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt "${#ZEN_FILES[@]}" ]; then
  echo "Invalid selection." >&2
  exit 1
fi

SELECTED="${ZEN_FILES[$((choice - 1))]}"

# Run depending on file type
case "$SELECTED" in
  *.txt)
    if $USE_LESS; then
      "$ZEN_PARSER" "$SELECTED" | less
    else
      "$ZEN_PARSER" "$SELECTED"
    fi
    ;;
  *.py)
    if $USE_LESS; then
      python3 "$SELECTED" | less
    else
      python3 "$SELECTED"
    fi
    ;;
  *)
    echo "Unknown Zen type: $(basename "$SELECTED")" >&2
    exit 1
    ;;
esac
