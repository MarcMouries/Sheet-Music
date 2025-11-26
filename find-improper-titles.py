#!/usr/bin/env python3
"""
Find all LilyPond files with improper or missing titles
"""
from pathlib import Path
import re

repo_root = Path('/Users/marc.mouries/projects/Sheet-Music')

# Common improper title patterns
IMPROPER_PATTERNS = [
    r'^untitled',
    r'^test',
    r'^blank',
    r'^book',
    r'^guitar\d+',
    r'^dynamics',
    r'^spacing',
    r'^copyright',
    r'^notes$',
    r'^\w{1,3}$',  # Very short titles (1-3 chars)
    r'^\d+$',  # Just numbers
    r'^KV\d+',  # Just catalog numbers
    r'^BWV\d+',  # Just BWV numbers
]

EXCLUDE_DIRS = {'.git', '.claude', 'stylesheets', 'Lilypond_How-to', 'node_modules', '__pycache__'}

# Files that are known to be component files (included by others)
COMPONENT_FILES = {
    'book.ly', 'book-1.ly', 'book-2.ly', 'guitar1.ly', 'guitar2.ly',
    'guitar3.ly', 'guitar4.ly', 'dynamicsa.ly', 'dynamicsb.ly',
    'dynamicsc.ly', 'blank.ly', 'blank1.ly', 'copyright.ly',
    'spacing.ly', 'gymnopedie-2.ly', 'gymnopedie-3.ly',
    'KV331_3_RondoAllaTurcaNotes.ly'
}

def parse_title(ly_file):
    """Extract title from LilyPond file"""
    try:
        content = ly_file.read_text(encoding='utf-8', errors='ignore')[:3000]

        # Check if file has a header block
        if not re.search(r'\\header\s*\{', content):
            return None, "no_header"

        header_match = re.search(r'\\header\s*\{([^}]*)(\}|$)', content, re.DOTALL)
        if not header_match:
            return None, "no_header"

        header = header_match.group(1)

        # Try to find title
        # Simple format: title = "text"
        pattern = r'title\s*=\s*"([^"]*)"'
        match = re.search(pattern, header)
        if match:
            return match.group(1), "has_title"

        # Markup format: title = \markup ...
        markup_pattern = r'title\s*=\s*\\markup[^"]*"([^"]*)"'
        markup_match = re.search(markup_pattern, header)
        if markup_match:
            return markup_match.group(1), "has_title"

        return None, "missing_title"

    except Exception as e:
        return None, f"error: {e}"

def is_improper_title(title):
    """Check if title matches improper patterns"""
    if not title:
        return True

    title_lower = title.lower().strip()

    # Check against improper patterns
    for pattern in IMPROPER_PATTERNS:
        if re.match(pattern, title_lower):
            return True

    return False

print("=" * 80)
print("FINDING FILES WITH IMPROPER OR MISSING TITLES")
print("=" * 80)

categories = {
    'no_header': [],
    'missing_title': [],
    'improper_title': [],
    'component_file': [],
}

for ly_file in sorted(repo_root.rglob('*.ly')):
    # Skip excluded directories
    if any(excluded in ly_file.parts for excluded in EXCLUDE_DIRS):
        continue

    rel_path = ly_file.relative_to(repo_root)

    # Check if it's a known component file
    if ly_file.name in COMPONENT_FILES:
        categories['component_file'].append((rel_path, ly_file.name))
        continue

    # Parse title
    title, status = parse_title(ly_file)

    if status == "no_header":
        categories['no_header'].append((rel_path, "No \\header block"))
    elif status == "missing_title":
        categories['missing_title'].append((rel_path, "Header exists but no title field"))
    elif is_improper_title(title):
        categories['improper_title'].append((rel_path, f'"{title}"'))

# Print results
print("\n📋 COMPONENT FILES (should be excluded from index):")
print(f"Found {len(categories['component_file'])} files\n")
for path, name in categories['component_file']:
    print(f"  • {path}")

print("\n\n❌ NO HEADER BLOCK:")
print(f"Found {len(categories['no_header'])} files\n")
for path, reason in categories['no_header']:
    print(f"  • {path}")
    print(f"    → {reason}")

print("\n\n⚠️  MISSING TITLE FIELD:")
print(f"Found {len(categories['missing_title'])} files\n")
for path, reason in categories['missing_title']:
    print(f"  • {path}")
    print(f"    → {reason}")

print("\n\n🔍 IMPROPER TITLE:")
print(f"Found {len(categories['improper_title'])} files\n")
for path, title in categories['improper_title']:
    print(f"  • {path}")
    print(f"    → Title: {title}")

# Summary
total_issues = len(categories['no_header']) + len(categories['missing_title']) + len(categories['improper_title'])
print("\n" + "=" * 80)
print(f"Summary:")
print(f"  Component files (OK to exclude): {len(categories['component_file'])}")
print(f"  Files with issues: {total_issues}")
print(f"    - No header: {len(categories['no_header'])}")
print(f"    - Missing title: {len(categories['missing_title'])}")
print(f"    - Improper title: {len(categories['improper_title'])}")
