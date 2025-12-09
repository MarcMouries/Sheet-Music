#!/usr/bin/env python3
"""
Update LilyPond files to use 'genre' and 'subgenre' fields instead of 'style'.

Based on the CSV schema mapping:
- Main genres: Jazz, Classical, Folk, Latin, Christmas (for carols), Pop, Film, etc.
- Subgenres capture specific styles: Gypsy Jazz, Klezmer, Irish Reel, etc.
"""

import re
import sys
from pathlib import Path

# Mapping of old style values to new genre + optional subgenre
STYLE_TO_GENRE_MAP = {
    # Classical
    "classical": ("Classical", None),
    "Classical": ("Classical", None),
    "baroque": ("Classical", None),
    "Baroque": ("Classical", None),
    "romantic": ("Classical", None),
    "Romantic": ("Classical", None),
    "concerto": ("Classical", None),
    "sonata": ("Classical", None),
    "passacaglia": ("Classical", None),

    # Jazz
    "jazz": ("Jazz", None),
    "gypsy jazz": ("Jazz", "Gypsy Jazz"),
    "swing": ("Jazz", None),

    # Folk by region
    "folk": ("Folk", None),
    "irish traditional": ("Folk", "Irish"),
    "jig": ("Folk", "Irish"),
    "reel": ("Folk", "Irish"),
    "slip jig": ("Folk", "Irish"),
    "slow air": ("Folk", "Irish"),
    "waltz": ("Folk", None),
    "klezmer": ("Folk", "Klezmer"),

    # Christmas
    "christmas carol": ("Christmas", None),
    "christmas song": ("Christmas", None),
    "christmas hymn": ("Christmas", None),

    # Practice/Exercise
    "practice exercise": ("Exercise", None),
}

def update_file(filepath):
    """Update a single LilyPond file."""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()

        # Find style = "value" pattern
        style_pattern = r'(\s*)style\s*=\s*"([^"]+)"'
        match = re.search(style_pattern, content)

        if not match:
            return None, "No style field found"

        indent = match.group(1)
        old_style = match.group(2)

        # Look up mapping
        if old_style not in STYLE_TO_GENRE_MAP:
            return None, f"Unknown style: {old_style}"

        genre, subgenre = STYLE_TO_GENRE_MAP[old_style]

        # Build replacement
        if subgenre:
            replacement = f'{indent}genre = "{genre}"\n{indent}subgenre = "{subgenre}"'
        else:
            replacement = f'{indent}genre = "{genre}"'

        # Replace
        new_content = re.sub(style_pattern, replacement, content, count=1)

        # Write back
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)

        return old_style, f"→ genre=\"{genre}\"" + (f", subgenre=\"{subgenre}\"" if subgenre else "")

    except Exception as e:
        return None, f"Error: {e}"

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 update-genre-fields.py <file_or_directory>")
        print("   or: python3 update-genre-fields.py --dry-run <file_or_directory>")
        sys.exit(1)

    dry_run = False
    if sys.argv[1] == "--dry-run":
        dry_run = True
        path_arg = sys.argv[2]
    else:
        path_arg = sys.argv[1]

    path = Path(path_arg)

    if path.is_file():
        files = [path]
    elif path.is_dir():
        files = list(path.rglob("*.ly"))
    else:
        print(f"Error: {path} is not a valid file or directory")
        sys.exit(1)

    updated_count = 0
    skipped_count = 0
    error_count = 0

    for filepath in sorted(files):
        old_style, result = update_file(filepath)

        if old_style:
            print(f"✓ {filepath}: {old_style} {result}")
            updated_count += 1
        elif "No style field" in result:
            skipped_count += 1
        else:
            print(f"✗ {filepath}: {result}")
            error_count += 1

    print(f"\n{'DRY RUN - ' if dry_run else ''}Summary:")
    print(f"  Updated: {updated_count}")
    print(f"  Skipped: {skipped_count}")
    print(f"  Errors:  {error_count}")

if __name__ == "__main__":
    main()
