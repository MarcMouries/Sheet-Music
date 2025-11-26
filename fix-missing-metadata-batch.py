#!/usr/bin/env python3
"""
Fix specific files with missing or incorrect metadata
"""
from pathlib import Path
import re

repo_root = Path('/Users/marc.mouries/projects/Sheet-Music')

# Specific fixes for files with missing metadata
FIXES = [
    # Gypsy Jazz files
    {
        'pattern': 'Gypsy-Jazz/Blues-en-Mineur/Blues-en-mineur.ly',
        'title': 'Blues en Mineur',
        'composer': 'Traditional',
        'style': 'gypsy jazz'
    },
    {
        'pattern': 'Gypsy-Jazz/Rythmes-gitans/Rythmes-Gitans.ly',
        'title': 'Rythmes Gitans',
        'composer': 'Traditional',
        'style': 'gypsy jazz'
    },
    {
        'pattern': 'Gypsy-Jazz/Rythmes-gitans/Rythmes-Gitans_Daisy.ly',
        'title': 'Rythmes Gitans (Daisy)',
        'composer': 'Traditional',
        'style': 'gypsy jazz'
    },
    {
        'pattern': 'Gypsy-Jazz/Si-tu-savais/Si-Tu-Savais.ly',
        'title': 'Si Tu Savais',
        'composer': 'Traditional',
        'style': 'gypsy jazz'
    },
    # Jazz files
    {
        'pattern': 'Jazz/As Time Goes By/As_Time_Goes_By_with_chords.ly',
        'title': 'As Time Goes By',
        'composer': 'Herman Hupfeld',
        'style': 'jazz'
    },
    {
        'pattern': 'Jazz/Misty/Misty.ly',
        'title': 'Misty',
        'composer': 'Erroll Garner',
        'style': 'jazz'
    },
    # Folk files
    {
        'pattern': 'Folk_Jewish/Chosen-Kalle/Chosen-Kalle-Mazel-Tov.ly',
        'title': 'Chosen Kalle Mazel Tov',
        'composer': 'Traditional',
        'style': 'klezmer'
    },
    {
        'pattern': 'Folk_Jewish/Papirosen/Papirosen.ly',
        'title': 'Papirosen',
        'composer': 'Traditional',
        'style': 'klezmer'
    },
    {
        'pattern': 'Folk_Ireland/Paddy-Faheys-Jig/Paddy-Faheys-Jig.ly',
        'title': "Paddy Fahey's Jig",
        'composer': 'Paddy Fahey',
        'style': 'irish traditional'
    },
    {
        'pattern': 'Folk_Ireland/Contraband-Police/Contraband-Police.ly',
        'title': 'Contraband Police',
        'composer': 'Traditional',
        'style': 'irish traditional'
    },
    {
        'pattern': 'Folk_Ireland/Darby-O-Gill/Darby-O-Gill-Fox-Chase.ly',
        'title': "Darby O' Gill - Fox Chase",
        'composer': 'Traditional',
        'style': 'irish traditional'
    },
    {
        'pattern': 'Folk_Germany/Muss-I-Denn/Muss-I-Denn.ly',
        'title': 'Muss I Denn',
        'composer': 'Traditional',
        'style': 'german traditional'
    },
    # Soundtrack
    {
        'pattern': 'Soundtrack/Swing_movie/Swing_Movie.ly',
        'title': 'from the Movie Swing (2002)',
        'composer': 'Tony Gatlif',
        'style': 'soundtrack'
    },
]

def fix_file_metadata(file_path, title, composer, style):
    """Add or update metadata in a LilyPond file"""
    try:
        content = file_path.read_text(encoding='utf-8', errors='ignore')

        # Check if file has header
        header_match = re.search(r'(\\header\s*\{)(.*?)(^})', content, re.DOTALL | re.MULTILINE)

        if not header_match:
            # No header - add one after version and includes
            version_match = re.search(r'(\\version[^\n]*\n)', content)
            include_matches = list(re.finditer(r'(\\include[^\n]*\n)', content))

            if include_matches:
                insert_pos = include_matches[-1].end()
            elif version_match:
                insert_pos = version_match.end()
            else:
                insert_pos = 0

            header = f'\n\\header {{\n  title = "{title}"\n  composer = "{composer}"\n  style = "{style}"\n  tagline = ""\n}}\n\n'
            new_content = content[:insert_pos] + header + content[insert_pos:]
            file_path.write_text(new_content, encoding='utf-8')
            return "added_header"

        # Has header - check what's missing
        header_start = header_match.group(1)
        header_content = header_match.group(2)
        header_end = header_match.group(3)

        # Parse existing fields
        has_title = bool(re.search(r'title\s*=', header_content))
        has_composer = bool(re.search(r'composer\s*=', header_content))
        has_style = bool(re.search(r'style\s*=', header_content))

        if has_title and has_composer and has_style:
            return "already_complete"

        # Build additions
        additions = []
        if not has_title:
            additions.append(f'  title = "{title}"')
        if not has_composer:
            additions.append(f'  composer = "{composer}"')
        if not has_style:
            additions.append(f'  style = "{style}"')

        # Find tagline to insert before it
        tagline_patterns = [
            r'(.*?)(  tagline\s*=\s*[^\n]*\n)(.*)',
            r'(.*?)(  encodingdate\s*=\s*[^\n]*\n)(.*)',
        ]

        inserted = False
        for pattern in tagline_patterns:
            match = re.search(pattern, header_content, re.DOTALL)
            if match:
                before = match.group(1)
                line = match.group(2)
                after = match.group(3)

                new_header_content = before + '\n'.join(additions) + '\n' + line + after
                new_content = content.replace(
                    header_match.group(0),
                    header_start + new_header_content + header_end
                )
                file_path.write_text(new_content, encoding='utf-8')
                inserted = True
                break

        if not inserted:
            # Add at beginning of header
            new_header_content = '\n' + '\n'.join(additions) + '\n' + header_content
            new_content = content.replace(
                header_match.group(0),
                header_start + new_header_content + header_end
            )
            file_path.write_text(new_content, encoding='utf-8')

        return "fixed"

    except Exception as e:
        return f"error: {e}"

print("=" * 80)
print("FIXING SPECIFIC FILES WITH MISSING METADATA")
print("=" * 80)

fixed = 0
skipped = 0
not_found = 0
errors = 0

for fix in FIXES:
    # Find file matching pattern
    matches = list(repo_root.glob(f"**/{fix['pattern'].split('/')[-1]}"))

    # Filter to exact path match
    file_path = None
    for match in matches:
        if fix['pattern'] in str(match.relative_to(repo_root)):
            file_path = match
            break

    if not file_path or not file_path.exists():
        print(f"\n❌ NOT FOUND: {fix['pattern']}")
        not_found += 1
        continue

    result = fix_file_metadata(
        file_path,
        fix['title'],
        fix['composer'],
        fix['style']
    )

    if result in ['fixed', 'added_header']:
        print(f"\n✅ FIXED: {file_path.relative_to(repo_root)}")
        print(f"   → Title: {fix['title']}")
        print(f"   → Composer: {fix['composer']}")
        fixed += 1
    elif result == 'already_complete':
        print(f"\n⏭️  SKIPPED: {file_path.relative_to(repo_root)} (already complete)")
        skipped += 1
    else:
        print(f"\n⚠️  ERROR: {file_path.relative_to(repo_root)}")
        print(f"   → {result}")
        errors += 1

print("\n" + "=" * 80)
print(f"Summary: {fixed} fixed, {skipped} skipped, {not_found} not found, {errors} errors")
