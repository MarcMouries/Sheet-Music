#!/usr/bin/env python3
"""
Intelligently add missing style fields based on folder location and composer
"""
from pathlib import Path
import re

repo_root = Path('/Users/marc.mouries/projects/Sheet-Music')

# Style mappings based on folder
STYLE_BY_FOLDER = {
    'Classical': 'classical',
    'Folk_Ireland': 'irish traditional',
    'Folk_Scotland': 'scottish traditional',
    'Folk_England': 'english traditional',
    'Folk_Finland': 'finnish traditional',
    'Folk_Canada': 'canadian traditional',
    'Folk_Hungary': 'hungarian traditional',
    'Folk_Jewish': 'klezmer',
    'Folk_Italy': 'italian traditional',
    'Folk_Russia': 'russian traditional',
    'Folk_Germany': 'german traditional',
    'Folk_Romania': 'romanian traditional',
    'Folk_USA': 'american folk',
    'Gypsy-Jazz': 'gypsy jazz',
    'Jazz': 'jazz',
    'Pop': 'pop',
    'Christmas': 'christmas',
}

def infer_style(file_path, title, composer):
    """Infer style from folder path, title, and composer"""
    parts = file_path.parts

    # Check folder-based style
    for folder, style in STYLE_BY_FOLDER.items():
        if folder in parts:
            # Refine based on title/composer if needed
            title_lower = title.lower()

            if 'waltz' in title_lower:
                return 'waltz'
            elif 'jig' in title_lower:
                return 'jig'
            elif 'reel' in title_lower:
                return 'reel'
            elif 'polka' in title_lower:
                return 'polka'
            elif 'medley' in title_lower:
                return 'medley'

            return style

    return None

def add_style_to_file(ly_file, style):
    """Add style field to file"""
    try:
        content = ly_file.read_text(encoding='utf-8', errors='ignore')

        # Check if already has style
        if re.search(r'style\s*=', content):
            return "already_has_style"

        # Find the header block
        header_match = re.search(r'(\\header\s*\{)(.*?)(\})', content, re.DOTALL)

        if not header_match:
            return "no_header"

        header_start = header_match.group(1)
        header_content = header_match.group(2)
        header_end = header_match.group(3)

        # Add style before tagline if exists, otherwise at end
        tagline_patterns = [
            r'(.*?)(tagline\s*=\s*"[^"]*")(.*)',
            r'(.*?)(tagline\s*=\s*##f)(.*)',
            r'(.*?)(tagline\s*=\s*##t)(.*)',
        ]

        for pattern in tagline_patterns:
            tagline_match = re.search(pattern, header_content, re.DOTALL)
            if tagline_match:
                before = tagline_match.group(1)
                tagline = tagline_match.group(2)
                after = tagline_match.group(3)

                new_header_content = before + f'  style = "{style}"\n  ' + tagline + after
                new_content = content.replace(
                    header_match.group(0),
                    header_start + new_header_content + header_end
                )

                ly_file.write_text(new_content, encoding='utf-8')
                return "fixed"

        # Add at end of header
        new_header_content = header_content.rstrip() + f'\n  style = "{style}"\n'
        new_content = content.replace(
            header_match.group(0),
            header_start + new_header_content + header_end
        )

        ly_file.write_text(new_content, encoding='utf-8')
        return "fixed"

    except Exception as e:
        return f"error: {e}"

def parse_basic_header(ly_file):
    """Get title and composer"""
    try:
        content = ly_file.read_text(encoding='utf-8', errors='ignore')[:3000]
        header_match = re.search(r'\\header\s*\{([^}]*)\}', content, re.DOTALL)

        title = ly_file.stem
        composer = ''

        if header_match:
            header = header_match.group(1)

            for field, pattern_name in [('title', title), ('composer', composer)]:
                pattern = rf'{field}\s*=\s*"([^"]+)"'
                match = re.search(pattern, header)
                if match:
                    if field == 'title':
                        title = match.group(1)
                    elif field == 'composer':
                        composer = match.group(1)
                else:
                    markup_pattern = rf'{field}\s*=\s*\\markup[^"]*"([^"]*)"'
                    markup_match = re.search(markup_pattern, header)
                    if markup_match:
                        if field == 'title':
                            title = markup_match.group(1)
                        elif field == 'composer':
                            composer = markup_match.group(1)

        return title, composer
    except:
        return ly_file.stem, ''

print("="*80)
print("FIXING MISSING STYLES")
print("="*80)

fixed = 0
skipped = 0
no_inference = 0

EXCLUDE_DIRS = {'.git', '.claude', 'stylesheets', 'Lilypond_How-to', 'node_modules', '__pycache__', 'Scales', 'Practice'}

for ly_file in sorted(repo_root.rglob('*.ly')):
    if any(excluded in ly_file.parts for excluded in EXCLUDE_DIRS):
        continue

    title, composer = parse_basic_header(ly_file)
    rel_path = ly_file.relative_to(repo_root)

    # Check if needs style
    content_check = ly_file.read_text(encoding='utf-8', errors='ignore')[:2000]
    if re.search(r'style\s*=', content_check):
        skipped += 1
        continue

    # Infer style
    style = infer_style(rel_path, title, composer)

    if style:
        result = add_style_to_file(ly_file, style)
        if result == "fixed":
            print(f"✅ {rel_path}")
            print(f"   → Added style: \"{style}\"")
            fixed += 1
        elif result == "already_has_style":
            skipped += 1
        else:
            print(f"⚠️  {result}: {rel_path}")
    else:
        no_inference += 1
        print(f"❓ Could not infer style: {rel_path}")

print(f"\n{'='*80}")
print(f"Summary: {fixed} fixed, {skipped} already had style, {no_inference} couldn't infer")
