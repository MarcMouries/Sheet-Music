#!/usr/bin/env bash
set -euo pipefail

# Batch update all LilyPond PDFs and SVG previews
# Skips files that already have recent previews

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
SVG_SCRIPT="$SCRIPT_DIR/make-score-preview-svg.sh"

cd "$REPO_ROOT"

# Find all .ly files (excluding includes, practice files, etc.)
echo "🎵 Finding LilyPond files to process..."

# Get list of tune directories from index
python3 -c "
import re
from pathlib import Path

index = open('index.html').read()
dirs = set(re.findall(r'data-directory=\"([^\"]+)\"', index))

for d in sorted(dirs):
    dir_path = Path(d)
    if not dir_path.exists():
        continue

    # Find main .ly files (excluding _music.ily)
    ly_files = [f for f in dir_path.glob('*.ly')
                if '_music.ily' not in f.name
                and not f.name.endswith('.ily')
                and 'PREVIEW WRAPPER' not in open(f).read(500)]

    for ly in ly_files:
        svg = ly.parent / (ly.stem + '-preview.svg')
        if not svg.exists():
            print(str(ly))
" | while read -r ly_file; do
    echo "Processing: $ly_file"
    if "$SVG_SCRIPT" "$ly_file" 2>/dev/null; then
        echo "  ✓ Success"
    else
        echo "  ✗ Failed (compilation error)"
    fi
done

echo ""
echo "✓ Batch processing complete!"
