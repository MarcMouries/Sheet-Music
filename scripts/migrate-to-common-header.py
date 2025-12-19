#!/usr/bin/env python3
"""
Script to migrate files to use common-header.ily instead of inline tagline.

This script:
1. Removes inline tagline = "" or tagline = ##f from \header blocks
2. Adds \include "../../common/common-header.ily" after the \header block
"""

import os
import re
import sys
from pathlib import Path

def calculate_relative_path(from_file, to_dir):
    """Calculate relative path from file to directory."""
    from_dir = Path(from_file).parent
    to_path = Path(to_dir)
    return os.path.relpath(to_path, from_dir)

def migrate_file(file_path, repo_root):
    """Migrate a single file to use common-header.ily."""

    # Skip if already includes common-header.ily
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    if 'common-header.ily' in content:
        return None, "already includes common-header.ily"

    # Calculate relative path
    rel_path = calculate_relative_path(file_path, os.path.join(repo_root, 'common'))

    # Pattern to match tagline in header block
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

    if not modified:
        return None, "no tagline found"

    # Add include after \header block
    # Find the closing brace of the header block
    header_pattern = r'(\\header\s*\{[^}]*\})'

    def add_include(match):
        return match.group(1) + f'\n\n\\include "{rel_path}/common-header.ily"'

    new_content = re.sub(header_pattern, add_include, content, count=1, flags=re.DOTALL)

    if new_content == content:
        return None, "could not find \\header block"

    # Create backup
    backup_path = str(file_path) + '.bak'
    with open(backup_path, 'w', encoding='utf-8') as f:
        f.write(content)

    # Write updated content
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(new_content)

    return True, "updated"

def main():
    script_dir = Path(__file__).parent
    repo_root = script_dir.parent

    print(f"Starting migration to common-header.ily...")
    print(f"Repository root: {repo_root}")
    print()

    # Find all .ly files with tagline
    ly_files = []
    for root, dirs, files in os.walk(repo_root):
        # Skip common and stylesheets directories
        dirs[:] = [d for d in dirs if d not in ['.git', 'common', 'stylesheets']]

        for file in files:
            if file.endswith('.ly'):
                file_path = Path(root) / file
                try:
                    with open(file_path, 'r', encoding='utf-8') as f:
                        if 'tagline' in f.read():
                            ly_files.append(file_path)
                except Exception as e:
                    print(f"Error reading {file_path}: {e}")

    count = 0
    updated = 0
    skipped = 0

    for file_path in ly_files:
        count += 1
        try:
            result, reason = migrate_file(file_path, repo_root)

            if result:
                print(f"[{count}] UPDATE: {file_path}")
                updated += 1
            else:
                print(f"[{count}] SKIP: {file_path} ({reason})")
                skipped += 1
        except Exception as e:
            print(f"[{count}] ERROR: {file_path} - {e}")
            skipped += 1

    print()
    print("Migration complete!")
    print(f"Total files processed: {count}")
    print(f"Files updated: {updated}")
    print(f"Files skipped: {skipped}")
    print()
    print("Backup files (.bak) have been created for all updated files.")
    print("Please test the changes before removing the backups.")

if __name__ == '__main__':
    main()
