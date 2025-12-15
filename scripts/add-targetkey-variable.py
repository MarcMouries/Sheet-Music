#!/usr/bin/env python3
"""
Add targetKey variable to LilyPond files that use \\transpose.

This script finds files with \\transpose commands and refactors them to use
a single targetKey variable instead of repeating the transposition keys.

Before:
    \\transpose e d \\chordNames
    \\transpose e d \\melody

After:
    targetKey = d
    \\transpose e \\targetKey \\chordNames
    \\transpose e \\targetKey \\melody
"""

import re
import sys
from pathlib import Path
from typing import Optional, Tuple

def find_transpose_pattern(content: str) -> Optional[Tuple[str, str]]:
    """
    Find the most common transpose pattern in the file.
    Returns (from_key, to_key) or None if no consistent pattern found.
    """
    # Find all transpose commands: \transpose FROM TO
    pattern = r'\\transpose\s+([a-z]+(?:es|is)?)\s+([a-z]+(?:es|is)?)'
    matches = re.findall(pattern, content)

    if not matches:
        return None

    # Count occurrences of each pattern
    from collections import Counter
    counter = Counter(matches)

    # Get the most common pattern
    if counter:
        most_common = counter.most_common(1)[0][0]
        return most_common

    return None

def add_targetkey_variable(file_path: Path, dry_run: bool = False) -> bool:
    """
    Add targetKey variable to a LilyPond file.
    Returns True if file was modified, False otherwise.
    """
    # Convert to absolute path for consistent handling
    file_path = file_path.resolve()

    try:
        rel_path = file_path.relative_to(Path.cwd())
    except ValueError:
        rel_path = file_path

    try:
        content = file_path.read_text()

        # Find the transpose pattern
        pattern = find_transpose_pattern(content)
        if not pattern:
            return False

        from_key, to_key = pattern

        # Check if file already has targetKey
        if 'targetKey' in content:
            print(f"⊘  {rel_path}: Already has targetKey")
            return False

        # Find where to insert targetKey (after \\include statements, before \\score)
        lines = content.split('\n')
        insert_line = None

        for i, line in enumerate(lines):
            # Find the last include or header before \score
            if '\\score' in line:
                # Insert before \score
                insert_line = i
                break
            elif '\\include' in line or '\\header' in line:
                # Keep track of last include/header
                insert_line = i + 1

        if insert_line is None:
            print(f"✗  {rel_path}: Could not find insertion point")
            return False

        # Insert targetKey variable
        lines.insert(insert_line, f'\ntargetKey = {to_key}\n')

        # Replace all transpose patterns
        new_content = '\n'.join(lines)
        new_content = re.sub(
            r'\\transpose\s+' + re.escape(from_key) + r'\s+' + re.escape(to_key),
            f'\\\\transpose {from_key} \\\\targetKey',
            new_content
        )

        if dry_run:
            print(f"🔍 {rel_path}: Would add targetKey = {to_key}")
            return True

        # Write back
        file_path.write_text(new_content)
        print(f"✓  {rel_path}: Added targetKey = {to_key}")
        return True

    except Exception as e:
        print(f"✗  {rel_path}: Error - {e}")
        return False

def main():
    import argparse

    parser = argparse.ArgumentParser(description='Add targetKey variable to LilyPond files')
    parser.add_argument('--dry-run', action='store_true', help='Show what would be done without doing it')
    parser.add_argument('files', nargs='*', help='Specific files to process (default: all .ly files)')

    args = parser.parse_args()

    root = Path.cwd()

    # Directories to skip
    skip_dirs = {'Scales', 'stylesheets', 'common', 'Learn Violin with Famous Themes',
                 '8-Step_Warm-Up_Plan', 'Harmonica', 'lilypong_how-to'}

    # Get files to process
    if args.files:
        files = [Path(f) for f in args.files]
    else:
        # Find all .ly files
        files = []
        for ly_file in root.rglob('*.ly'):
            # Skip if in excluded directory
            if any(skip_dir in ly_file.parts for skip_dir in skip_dirs):
                continue
            # Skip if filename starts with underscore or contains _music.ily
            if ly_file.name.startswith('_') or ly_file.name.endswith('_music.ily'):
                continue
            files.append(ly_file)

    print(f"\n{'='*70}")
    print(f"Add targetKey Variable to LilyPond Files")
    print(f"{'='*70}")
    print(f"Files to process: {len(files)}")
    if args.dry_run:
        print("Mode: DRY RUN (no changes)")
    print(f"{'='*70}\n")

    modified = 0
    skipped = 0

    for file_path in sorted(files):
        if add_targetkey_variable(file_path, dry_run=args.dry_run):
            modified += 1
        else:
            skipped += 1

    print(f"\n{'='*70}")
    print(f"Summary")
    print(f"{'='*70}")
    print(f"Total files processed: {len(files)}")
    print(f"Files modified: {modified}")
    print(f"Files skipped: {skipped}")
    print(f"{'='*70}\n")

if __name__ == '__main__':
    main()
