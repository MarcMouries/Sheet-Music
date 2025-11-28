#!/usr/bin/env python3
"""
Fix include paths in all .ly files to use correct relative paths.

Organization:
- common/ - Functional includes (violin-functions.ly, includes.ly, markups.ly, score.ly, improviso.ily)
- stylesheets/ - Visual/styling includes (bars-per-line-engraver.ly, twoByTwoBeaming.ly, stylesheet*.ly, etc.)
"""

import os
import re
from pathlib import Path
from typing import List, Tuple

# Files that should be in common/
COMMON_FILES = {
    'violin-functions.ly',
    'includes.ly',
    'markups.ly',
    'score.ly',
    'improviso.ily',
    'title-formatting.ly',
}

# Files that should be in stylesheets/
STYLESHEET_FILES = {
    'bars-per-line-engraver.ly',
    'twoByTwoBeaming.ly',
    'stylesheet_fiddle.ly',
    'stylesheet_lighter.ly',
    'stylesheet.ily',
    'LilyJAZZ.ily',
    'lv-goldenage.ily',
    'paganini.ily',
    'profondo.ily',
    'fingering-slide-engraver.ly',
}

def get_relative_path(from_file: Path, to_dir: str, filename: str) -> str:
    """Calculate relative path from a .ly file to an include file."""
    file_dir = from_file.parent
    root_dir = from_file.parents[len(file_dir.relative_to(from_file.parents[len(file_dir.parts) - 1]).parts) - 1]

    # Calculate depth (how many ../ needed)
    depth = len(file_dir.relative_to(from_file.parents[len(file_dir.parts) - 1]).parts)

    # Build path
    if depth == 0:
        return f"./{to_dir}/{filename}"
    else:
        return f"{'../' * depth}{to_dir}/{filename}"

def fix_include_path(line: str, ly_file: Path) -> str:
    """Fix a single include line."""
    # Match \include "filename"
    match = re.match(r'^(\\include\s+["\'])([^"\']+)(["\'])', line)
    if not match:
        return line

    prefix, path, suffix = match.groups()
    filename = os.path.basename(path)

    # Skip language includes and local file includes
    if filename in ['english.ly', 'deutsch.ly', 'italiano.ly'] or \
       filename.startswith('.') or path.startswith('./'):
        return line

    # Skip if it's including another music file (not a library file)
    if not any(filename in files for files in [COMMON_FILES, STYLESHEET_FILES]):
        return line

    # Determine correct path
    if filename in COMMON_FILES:
        target_dir = 'common'
    elif filename in STYLESHEET_FILES:
        target_dir = 'stylesheets'
    else:
        return line  # Unknown file, leave as is

    # Calculate relative path from file to target directory
    # Find repository root (where common/ and stylesheets/ are)
    current = ly_file.parent
    depth = 0
    while current.name != '' and not (current / 'common').exists():
        depth += 1
        current = current.parent
        if depth > 10:  # Safety check
            return line  # Can't find root, leave as is

    new_path = f"{'../' * depth}{target_dir}/{filename}"

    return f"{prefix}{new_path}{suffix}\n"

def process_file(ly_file: Path, dry_run: bool = False) -> Tuple[bool, int]:
    """Process a single .ly file and fix include paths."""
    try:
        with open(ly_file, 'r', encoding='utf-8') as f:
            lines = f.readlines()

        new_lines = []
        changes = 0

        for line in lines:
            if line.strip().startswith('\\include'):
                new_line = fix_include_path(line, ly_file)
                if new_line != line:
                    changes += 1
                    print(f"  {ly_file.relative_to(Path.cwd())}:")
                    print(f"    OLD: {line.rstrip()}")
                    print(f"    NEW: {new_line.rstrip()}")
                new_lines.append(new_line)
            else:
                new_lines.append(line)

        if changes > 0 and not dry_run:
            with open(ly_file, 'w', encoding='utf-8') as f:
                f.writelines(new_lines)
            return (True, changes)

        return (changes > 0, changes)

    except Exception as e:
        print(f"  ERROR processing {ly_file}: {e}")
        return (False, 0)

def main():
    import argparse

    parser = argparse.ArgumentParser(description='Fix include paths in .ly files')
    parser.add_argument('--dry-run', action='store_true',
                       help='Show what would be changed without modifying files')
    args = parser.parse_args()

    root_dir = Path(__file__).resolve().parent.parent
    os.chdir(root_dir)

    print("=" * 80)
    print("FIX INCLUDE PATHS")
    print("=" * 80)
    if args.dry_run:
        print("DRY RUN MODE - No files will be modified")
    print()

    # Find all .ly files (excluding templates)
    exclude_dirs = {'Scales', 'common', 'stylesheets'}
    ly_files = []

    for ly_file in root_dir.rglob("*.ly"):
        rel_path = ly_file.relative_to(root_dir)
        if not any(excluded in rel_path.parts for excluded in exclude_dirs):
            ly_files.append(ly_file)

    print(f"Found {len(ly_files)} .ly files to check")
    print()

    total_files_changed = 0
    total_changes = 0

    for ly_file in sorted(ly_files):
        changed, num_changes = process_file(ly_file, dry_run=args.dry_run)
        if changed:
            total_files_changed += 1
            total_changes += num_changes

    print()
    print("=" * 80)
    print("SUMMARY")
    print("=" * 80)
    print(f"Files checked:     {len(ly_files)}")
    print(f"Files changed:     {total_files_changed}")
    print(f"Total changes:     {total_changes}")
    print("=" * 80)

    if args.dry_run and total_changes > 0:
        print()
        print("Run without --dry-run to apply changes")

if __name__ == "__main__":
    main()
