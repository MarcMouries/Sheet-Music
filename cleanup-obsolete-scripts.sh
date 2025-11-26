#!/bin/bash
# Delete one-time fix scripts that have completed their purpose

REPO_ROOT="/Users/marc.mouries/projects/Sheet-Music"

echo "🗑️  Deleting obsolete one-time fix scripts..."
echo ""

# One-time fix scripts (completed tasks)
SCRIPTS_TO_DELETE=(
    "fix-markup-headers.py"
    "fix-missing-metadata-batch.py"
    "fix-missing-styles.py"
    "fix-practice-metadata.py"
    "fix-pdf-names.py"
    "find-improper-titles.py"
    "add-videos.py"
    "add_stylesheet_include.py"
    "analyze_structure.py"
)

for script in "${SCRIPTS_TO_DELETE[@]}"; do
    if [ -f "$REPO_ROOT/$script" ]; then
        echo "  ✓ Deleting: $script"
        rm "$REPO_ROOT/$script"
    fi
done

echo ""
echo "✅ KEPT (active files):"
echo "  - generate-index-page.py (main index generator)"
echo "  - test-midi.html (MIDI testing reference)"
echo "  - README.md"
echo "  - analyze-metadata.py (may be useful again)"
echo "  - .music-metadata-template.json (reference)"
echo "  - cleanup-obsolete-scripts.sh (this script)"
echo ""
echo "📚 KEPT (all documentation .md files)"
echo ""
echo "Done!"
