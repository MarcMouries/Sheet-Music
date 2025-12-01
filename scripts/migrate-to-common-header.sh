#!/bin/bash

# Script to migrate files to use common-header.ily instead of inline tagline
# This script:
# 1. Removes inline tagline = "" or tagline = ##f from \header blocks
# 2. Adds \include "../../common/common-header.ily" after the \header block

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

echo "Starting migration to common-header.ily..."
echo "Repository root: $REPO_ROOT"
echo ""

# Find all .ly files with inline tagline
FILES=$(find "$REPO_ROOT" -name "*.ly" -type f \
    -not -path "*/\.git/*" \
    -not -path "*/common/*" \
    -not -path "*/stylesheets/*" \
    -exec grep -l "tagline.*=" {} \;)

COUNT=0
UPDATED=0
SKIPPED=0

for file in $FILES; do
    COUNT=$((COUNT + 1))

    # Skip if already includes common-header.ily
    if grep -q "common-header.ily" "$file"; then
        echo "[$COUNT] SKIP: $file (already includes common-header.ily)"
        SKIPPED=$((SKIPPED + 1))
        continue
    fi

    # Calculate relative path from file to common/
    FILE_DIR=$(dirname "$file")
    REL_PATH=$(python3 -c "import os; print(os.path.relpath('$REPO_ROOT/common', '$FILE_DIR'))")

    # Create backup
    cp "$file" "$file.bak"

    # Use Python to do the replacement because it's more reliable for multiline
    python3 - "$file" "$REL_PATH" << 'PYTHON_SCRIPT'
import sys
import re

file_path = sys.argv[1]
rel_path = sys.argv[2]

with open(file_path, 'r') as f:
    content = f.read()

# Pattern to match tagline in header block
# Match: tagline = "" or tagline = ##f or tagline  = ##f
tagline_patterns = [
    r'\s*tagline\s*=\s*""',
    r'\s*tagline\s*=\s*##f',
    r'\s*tagline\s*=\s*##t',
]

modified = False
for pattern in tagline_patterns:
    if re.search(pattern, content):
        content = re.sub(pattern, '', content)
        modified = True

# Add include after \header block if not already present
# Find the closing brace of the header block
if modified and 'common-header.ily' not in content:
    # Look for \header { ... } and add include after it
    # This regex finds \header block and captures everything up to its closing brace
    header_pattern = r'(\\header\s*\{[^}]*\})'

    def add_include(match):
        return match.group(1) + f'\n\n\\include "{rel_path}/common-header.ily"'

    content = re.sub(header_pattern, add_include, content, count=1, flags=re.DOTALL)

if modified:
    with open(file_path, 'w') as f:
        f.write(content)
    sys.exit(0)  # Success
else:
    sys.exit(1)  # No changes needed

PYTHON_SCRIPT

    if [ $? -eq 0 ]; then
        echo "[$COUNT] UPDATE: $file"
        UPDATED=$((UPDATED + 1))
    else
        # Restore backup if no changes were made
        mv "$file.bak" "$file" 2>/dev/null || true
        echo "[$COUNT] SKIP: $file (no tagline found or other issue)"
        SKIPPED=$((SKIPPED + 1))
    fi
done

echo ""
echo "Migration complete!"
echo "Total files processed: $COUNT"
echo "Files updated: $UPDATED"
echo "Files skipped: $SKIPPED"
echo ""
echo "Backup files (.bak) have been created for all updated files."
echo "Please test the changes before removing the backups."
