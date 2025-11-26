#!/usr/bin/env python3
"""
Batch fix metadata for practice exercises and scale files
"""
from pathlib import Path
import re

repo_root = Path('/Users/marc.mouries/projects/Sheet-Music')

# Folders containing practice/exercise files
PRACTICE_FOLDERS = [
    '8-Step_Warm-Up_Plan',
    'Practice',
    'Scales',
    "Marc's Practice Points"
]

def add_metadata_to_file(ly_file):
    """Add composer and style to practice files"""
    try:
        content = ly_file.read_text(encoding='utf-8', errors='ignore')

        # Check if already has composer and style
        has_composer = bool(re.search(r'composer\s*=', content))
        has_style = bool(re.search(r'style\s*=', content))

        if has_composer and has_style:
            return "already_complete"

        # Find the header block
        header_match = re.search(r'(\\header\s*\{)(.*?)(\})', content, re.DOTALL)

        if not header_match:
            return "no_header"

        header_start = header_match.group(1)
        header_content = header_match.group(2)
        header_end = header_match.group(3)

        # Add missing fields
        additions = []
        if not has_composer:
            additions.append('  composer = "Marc Mouries"')
        if not has_style:
            additions.append('  style = "practice exercise"')

        # Find where to insert (before tagline if exists, otherwise at end)
        tagline_patterns = [
            r'(.*?)(tagline\s*=\s*"[^"]*")(.*)',
            r'(.*?)(tagline\s*=\s*##f)(.*)',
        ]

        inserted = False
        for pattern in tagline_patterns:
            tagline_match = re.search(pattern, header_content, re.DOTALL)
            if tagline_match:
                before = tagline_match.group(1)
                tagline = tagline_match.group(2)
                after = tagline_match.group(3)

                new_header_content = before + '\n'.join(additions) + '\n  ' + tagline + after
                new_content = content.replace(
                    header_match.group(0),
                    header_start + new_header_content + header_end
                )

                ly_file.write_text(new_content, encoding='utf-8')
                inserted = True
                break

        if not inserted:
            # Add at end of header
            new_header_content = header_content.rstrip() + '\n' + '\n'.join(additions) + '\n'
            new_content = content.replace(
                header_match.group(0),
                header_start + new_header_content + header_end
            )
            ly_file.write_text(new_content, encoding='utf-8')

        return "fixed"

    except Exception as e:
        return f"error: {e}"

print("="*80)
print("FIXING PRACTICE/EXERCISE METADATA")
print("="*80)

fixed = 0
skipped = 0
errors = 0

for folder in PRACTICE_FOLDERS:
    folder_path = repo_root / folder
    if not folder_path.exists():
        continue

    print(f"\nProcessing {folder}/...")

    for ly_file in folder_path.rglob('*.ly'):
        result = add_metadata_to_file(ly_file)

        if result == "fixed":
            print(f"  ✅ Fixed: {ly_file.relative_to(repo_root)}")
            fixed += 1
        elif result == "already_complete":
            skipped += 1
        else:
            print(f"  ⚠️  {result}: {ly_file.relative_to(repo_root)}")
            errors += 1

print(f"\n{'='*80}")
print(f"Summary: {fixed} fixed, {skipped} already complete, {errors} errors")
