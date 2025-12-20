#!/usr/bin/env bash
set -euo pipefail

# Render SVG preview from a LilyPond file
# SVG output is scalable and can be themed with CSS
#
# The script generates both:
#   - tune-preview.svg (original, for light mode)
#   - Modifies the SVG to use currentColor for CSS theming

show_help() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS] file.ly

Render a LilyPond score to SVG preview.

Options:
  --help              Show this help.

The SVG is processed to support CSS theming:
  - Black strokes/fills are replaced with 'currentColor'
  - This allows the parent element's color to control the SVG

Examples:
  $(basename "$0") my-tune.ly

Requires:
  - lilypond
  - sed
EOF
}

if [ $# -eq 0 ]; then
  show_help
  exit 1
fi

# --- Parse options ---
while [[ $# -gt 0 ]]; do
  case "$1" in
    --help)
      show_help
      exit 0
      ;;
    -*)
      echo "Unknown option: $1" >&2
      show_help
      exit 1
      ;;
    *)
      LY_FILE="$1"
      shift
      break
      ;;
  esac
done

if [ -z "${LY_FILE:-}" ]; then
  echo "Error: no .ly file provided." >&2
  exit 1
fi

if [ ! -f "$LY_FILE" ]; then
  echo "Error: file not found: $LY_FILE" >&2
  exit 1
fi

# --- Check dependencies ---
command -v lilypond >/dev/null 2>&1 || { echo "Error: lilypond not found in PATH."; exit 1; }

BASENAME="$(basename "$LY_FILE" .ly)"
DIRNAME="$(dirname "$LY_FILE")"
SVG_OUT="${DIRNAME}/${BASENAME}-preview.svg"
TEMP_OUT="${DIRNAME}/${BASENAME}-temp"

echo "Rendering SVG with LilyPond..."
lilypond -fsvg --loglevel=ERROR -dno-midi -o "$TEMP_OUT" "$LY_FILE" 2>/dev/null

# Find the output SVG (might be .svg or -page1.svg for multi-page)
if [ -f "${TEMP_OUT}.svg" ]; then
  TEMP_SVG="${TEMP_OUT}.svg"
elif [ -f "${TEMP_OUT}-page1.svg" ]; then
  TEMP_SVG="${TEMP_OUT}-page1.svg"
  echo "Multi-page score detected, using page 1 for preview."
else
  echo "Error: expected output ${TEMP_OUT}.svg not found." >&2
  exit 1
fi

# Process SVG to make it CSS-themeable
# Replace black colors with currentColor for CSS theming
echo "Processing SVG for CSS theming..."

# Create a processed version that uses currentColor
# This makes the SVG inherit color from its parent element
sed -e 's/fill="#000000"/fill="currentColor"/g' \
    -e 's/fill="#000"/fill="currentColor"/g' \
    -e 's/fill:black/fill:currentColor/g' \
    -e 's/fill="black"/fill="currentColor"/g' \
    -e 's/stroke="#000000"/stroke="currentColor"/g' \
    -e 's/stroke="#000"/stroke="currentColor"/g' \
    -e 's/stroke:black/stroke:currentColor/g' \
    -e 's/stroke="black"/stroke="currentColor"/g' \
    "$TEMP_SVG" > "$SVG_OUT"

# Clean up temp files
rm -f "${TEMP_OUT}".svg "${TEMP_OUT}"-page*.svg "${TEMP_OUT}".midi

echo "Done: $SVG_OUT"
echo "  The SVG uses 'currentColor' - set color via CSS to theme it."
