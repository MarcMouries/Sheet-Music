#!/usr/bin/env python3
"""
Extract plain text from \markup headers and optionally add formatting to \paper block
"""
from pathlib import Path
import re
import sys

REPO_ROOT = Path('/Users/marc.mouries/projects/Sheet-Music')

def extract_text_from_markup(markup_str):
    """Extract plain text from complex \markup expressions"""
    # Find all quoted strings in the markup
    quotes = re.findall(r'"([^"]+)"', markup_str)
    if quotes:
        # Return the last quote (usually the actual content)
        return quotes[-1]
    return None

def fix_header_file(ly_file, dry_run=True):
    """Fix a LilyPond file by extracting text from markup headers"""
    try:
        content = ly_file.read_text(encoding='utf-8', errors='ignore')

        # Find the header block
        header_match = re.search(r'(\\header\s*\{)(.*?)(^\})', content, re.DOTALL | re.MULTILINE)
        if not header_match:
            return None, "No header block"

        header_start = header_match.group(1)
        header_content = header_match.group(2)
        header_end = header_match.group(3)

        # Check for markup in title, composer, poet
        changes = []
        new_header = header_content

        for field in ['title', 'composer', 'poet', 'subtitle']:
            # Find field with \markup
            pattern = rf'({field}\s*=\s*)(\\markup[^\n]+)'
            match = re.search(pattern, new_header)

            if match:
                field_name = match.group(1)
                markup_value = match.group(2)

                # Extract text
                text = extract_text_from_markup(markup_value)
                if text:
                    # Replace with simple string
                    new_value = f'{field_name}"{text}"'
                    new_header = new_header.replace(match.group(0), new_value)
                    changes.append(f"{field}: '{text}'")

        if not changes:
            return None, "No markup found"

        # Build new content
        new_content = content.replace(
            header_match.group(0),
            header_start + new_header + header_end
        )

        if not dry_run:
            ly_file.write_text(new_content, encoding='utf-8')
            return True, f"Fixed: {', '.join(changes)}"
        else:
            return True, f"Would fix: {', '.join(changes)}"

    except Exception as e:
        return False, f"Error: {e}"

def main():
    dry_run = '--apply' not in sys.argv

    print("=" * 80)
    print("FIXING MARKUP IN HEADERS")
    print("=" * 80)
    if dry_run:
        print("DRY RUN - use --apply to make changes")
    else:
        print("APPLYING CHANGES")
    print()

    # Files to check
    files_to_check = [
        "Christmas/The First Noel/The First Noel.ly",
        "Folk_Ireland/Trip to Pakistan/tripToPakistan.ly",
        "Folk_USA/You_are_my_Sunshine/You_are_my_Sunshine - Piano.ly",
        "Classical/Hinata_Reflections/Toshifumi-Hinata-Reflections.ly",
    ]

    fixed = 0
    skipped = 0
    errors = 0

    for file_path in files_to_check:
        ly_file = REPO_ROOT / file_path
        if not ly_file.exists():
            print(f"⚠️  NOT FOUND: {file_path}")
            errors += 1
            continue

        success, message = fix_header_file(ly_file, dry_run=dry_run)

        if success:
            print(f"✅ {file_path}")
            print(f"   {message}")
            fixed += 1
        elif success is None:
            print(f"⏭️  {file_path}")
            print(f"   {message}")
            skipped += 1
        else:
            print(f"❌ {file_path}")
            print(f"   {message}")
            errors += 1
        print()

    print("=" * 80)
    print(f"Summary: {fixed} fixed, {skipped} skipped, {errors} errors")
    if dry_run:
        print("\nRun with --apply to make changes")

if __name__ == "__main__":
    main()
