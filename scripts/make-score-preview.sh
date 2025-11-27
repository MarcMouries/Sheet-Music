#!/usr/bin/env bash
set -euo pipefail

# Render full-page PNG from a LilyPond file and crop the TOP portion
# using macOS 'sips' (no ImageMagick needed).
#
# We crop from (offsetX=0, offsetY=0) downwards, so the result is the
# top band of the page (title + first 1–2 staves depending on height).

show_help() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS] file.ly

Render a LilyPond score to PNG and crop a preview using 'sips'.

Options:
  -h, --height N      Crop height in pixels (overrides --percent).
  -p, --percent N     Crop height as N%% of page height (default: 40).
  -r, --resolution N  PNG resolution DPI for LilyPond (default: 300).
  --help              Show this help.

Notes:
  - Chords/lyrics/multiple staves increase vertical space,
    so you may want a larger --percent (e.g. 45–55).

Examples:
  $(basename "$0") my-tune.ly
  $(basename "$0") --percent 45 my-tune.ly
  $(basename "$0") --height 650 my-tune.ly

Requires:
  - lilypond
  - sips (built into macOS)
EOF
}

CROP_HEIGHT=""
CROP_PERCENT=40     # start a bit conservative; adjust per taste
RESOLUTION=300

if [ $# -eq 0 ]; then
  show_help
  exit 1
fi

# --- Parse options ---
while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--height)
      CROP_HEIGHT="$2"
      shift 2
      ;;
    -p|--percent)
      CROP_PERCENT="$2"
      shift 2
      ;;
    -r|--resolution)
      RESOLUTION="$2"
      shift 2
      ;;
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
command -v sips     >/dev/null 2>&1 || { echo "Error: sips not found (should exist on macOS)."; exit 1; }

BASENAME="$(basename "$LY_FILE" .ly)"
FULL_OUT="${BASENAME}-full"
PREVIEW_OUT="${BASENAME}-preview.png"

echo "Rendering full-page PNG with LilyPond..."
lilypond -fpng -dresolution="$RESOLUTION" -o "$FULL_OUT" "$LY_FILE"

FULL_PNG="${FULL_OUT}.png"

if [ ! -f "$FULL_PNG" ]; then
  echo "Error: expected output ${FULL_PNG} not found." >&2
  exit 1
fi

# --- Get dimensions ---
IMG_W=$(sips -g pixelWidth  "$FULL_PNG" | awk '/pixelWidth/  {print $2}')
IMG_H=$(sips -g pixelHeight "$FULL_PNG" | awk '/pixelHeight/ {print $2}')


# After computing IMG_W, IMG_H, and CROP_HEIGHT …


# --- Determine crop height ---
if [ -z "$CROP_HEIGHT" ]; then
  CROP_HEIGHT=$(( IMG_H * CROP_PERCENT / 100 ))
  echo "Image size: ${IMG_W}x${IMG_H}px → cropping TOP ${CROP_HEIGHT}px (${CROP_PERCENT}%)."
else
  echo "Image size: ${IMG_W}x${IMG_H}px → cropping TOP ${CROP_HEIGHT}px (explicit height)."
fi

# Safety: never exceed image height
if [ "$CROP_HEIGHT" -gt "$IMG_H" ]; then
  CROP_HEIGHT="$IMG_H"
fi


# sips expects cropOffset offsetY offsetX
OFFSET_Y=1   # start 1px below the very top
OFFSET_X=0   # flush with the left edge

sips -c "$CROP_HEIGHT" "$IMG_W" \
     --cropOffset "$OFFSET_Y" "$OFFSET_X" \
     "$FULL_PNG" --out "$PREVIEW_OUT" >/dev/null


echo "Done:"
echo "  Full page : $FULL_PNG"
echo "  Preview   : $PREVIEW_OUT"
