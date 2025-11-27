#!/usr/bin/env bash
set -euo pipefail

show_help() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS] file.ly

Generate a cropped preview image (PNG or SVG) of a tagged region
in a LilyPond score.

The LilyPond file should define preview regions with tags like:
  \\tag #'preview { ... }
  \\tag #'preview-4 { ... }
  \\tag #'preview-8 { ... }

Options:
  -b, --bars N          Use tag 'preview-N' (e.g. N=4 -> preview-4).
                        If omitted, uses tag 'preview'.
  -s, --staff-size N    Override staff size via set-global-staff-size (e.g. 14, 16, 18).
  -F, --format FORMAT   Output format: png (default) or svg.
  -r, --resolution DPI  PNG resolution (DPI). Default: 300.
  -h, --help            Show this help message.

Examples:
  $(basename "$0") make-score-preview-lilypond-example.ly
  $(basename "$0") -b 4 -s 16 make-score-preview-lilypond-example.ly
  $(basename "$0") -F svg make-score-preview-lilypond-example.ly
EOF
}

# Defaults
BARS=""
STAFF_SIZE=""
FORMAT="png"
RESOLUTION=300

# Parse options
if [ $# -eq 0 ]; then
  show_help
  exit 1
fi

while [[ $# -gt 0 ]]; do
  case "$1" in
    -b|--bars)
      BARS="$2"
      shift 2
      ;;
    -s|--staff-size)
      STAFF_SIZE="$2"
      shift 2
      ;;
    -F|--format)
      FORMAT="$2"
      shift 2
      ;;
    -r|--resolution)
      RESOLUTION="$2"
      shift 2
      ;;
    -h|--help)
      show_help
      exit 0
      ;;
    -*)
      echo "Unknown option: $1" >&2
      show_help
      exit 1
      ;;
    *)
      # First non-option is the LilyPond file
      LY_FILE="$1"
      shift
      break
      ;;
  esac
done

# Sanity checks
if [ -z "${LY_FILE:-}" ]; then
  echo "Error: No LilyPond file provided." >&2
  show_help
  exit 1
fi

if [ ! -f "$LY_FILE" ]; then
  echo "Error: File not found: $LY_FILE" >&2
  exit 1
fi

if [[ "$FORMAT" != "png" && "$FORMAT" != "svg" ]]; then
  echo "Error: FORMAT must be 'png' or 'svg', got '$FORMAT'." >&2
  exit 1
fi

BASENAME="$(basename "$LY_FILE" .ly)"

# Determine tag name:
#   no --bars      -> 'preview'
#   --bars 4       -> 'preview-4'
if [ -n "$BARS" ]; then
  TAG_NAME="preview-$BARS"
else
  TAG_NAME="preview"
fi

# Build LilyPond options
LILYPOND_OPTS=()

# Cropping
LILYPOND_OPTS+=("-dcrop")

# Include only the preview tag
LILYPOND_OPTS+=("-dinclude-tags=$TAG_NAME")

# Output format
if [ "$FORMAT" = "png" ]; then
  LILYPOND_OPTS+=("-fpng")
  LILYPOND_OPTS+=("-dresolution=$RESOLUTION")
else
  # SVG
  LILYPOND_OPTS+=("-dbackend=svg")
  LILYPOND_OPTS+=("-dno-point-and-click")
fi

# Staff size (if given)
if [ -n "$STAFF_SIZE" ]; then
  # This runs before the file is processed and sets global staff size
  LILYPOND_OPTS+=("-e" "(set-global-staff-size $STAFF_SIZE)")
fi

# Output prefix
OUT_PREFIX="${BASENAME}-preview-${TAG_NAME}"

echo "Generating score preview:"
echo "  File:          $LY_FILE"
echo "  Tag:           $TAG_NAME"
echo "  Format:        $FORMAT"
[ "$FORMAT" = "png" ] && echo "  Resolution:    ${RESOLUTION} DPI"
[ -n "$STAFF_SIZE" ] && echo "  Staff size:    $STAFF_SIZE"
echo "  Output prefix: $OUT_PREFIX"
echo

lilypond \
  "${LILYPOND_OPTS[@]}" \
  -o "$OUT_PREFIX" \
  "$LY_FILE"
