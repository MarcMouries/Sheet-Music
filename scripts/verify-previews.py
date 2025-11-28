#!/usr/bin/env python3
"""
Verify that all 20 originally requested files have:
1. Correct title
2. Correct composer
3. Preview image
"""

import os
import re
from pathlib import Path

# The 20 files we fixed
FILES_TO_CHECK = [
    ('Classical/Bach_Badinerie/Bach-Badinerie.ly', 'Badinerie', 'Johann Sebastian Bach'),
    ('Classical/Brahms_Berceuse/Brahms-Berceuse.ly', 'Wiegenlied (Lullaby / Berceuse)', 'Johannes Brahms'),
    ('Classical/Paradis - Sicilienne/Paradis-Sicilienne.ly', 'Sicilienne', 'Maria-Theresia von Paradis'),
    ('Classical/Paganini_Io-ti-penso-amore/Io-Ti-Penso-Amore.ly', 'Io Ti Penso Amore', 'Niccolò Paganini'),
    ('Classical/Mozart_Rondo_Alla_Turca/KV331_3_RondoAllaTurca.ly', 'Rondo Alla Turca', 'W. A. Mozart'),
    ('Classical/Mel Bonis - Suite en trio, Op.59/Mel-BONIS-Serenade.ly', 'Sérénade', 'Mel Bonis'),
    ('Classical/The Mad Lover (Eccles, John)/The Mad Lover (Eccles, John).ly', 'The Mad Lover', 'John Eccles'),
    ('Folk_Canada/Teardrop Waltz/Teardrop Waltz_Marc.ly', 'Teardrop Waltz', 'Reg Bouvette'),
    ('Folk_USA/Devils Dream/Devil\'s Dream.ly', 'Devil\'s Dream', 'Traditional'),
    ('Folk_USA/The-Star-Spangled-Banner/The-Star Spangled Banner.ly', 'Star Spangled Banner', 'John Stafford Smith'),
    ('Folk_USA/You_are_my_Sunshine/You_are_my_Sunshine.ly', 'You are my Sunshine', 'Jimmie Davis and Charles Mitchell'),
    ('Folk_Ireland/The Trip To Sligo (Jig)/The Trip To Sligo (Jig).ly', 'The Trip To Sligo', 'Traditional'),
    ('Folk_Ireland/The Trip To Sligo (Jig)/triptosligo-3.ly', 'The Trip To Sligo', 'Traditional'),  # Has wrong title
    ('Gypsy-Jazz/Bistro-Fada/Bistro_Fada.xml.ly', 'Bistro Fada', 'Stephane Wrembel'),
    ('Gypsy-Jazz/Blues-en-Mineur/Blues-en-Mineur.ly', 'Blues en Mineur', 'Django Reinhardt'),
    ('Gypsy-Jazz/Daphné/Daphne - Grappelli+Taylor.ly', 'Daphné', 'Django Reinhardt'),
    ('Gypsy-Jazz/Minor-Swing/Minor Swing - van Hemert.ly', 'Minor Swing', 'Django Reinhardt & Stéphane Grappelli'),
    ('Gypsy-Jazz/Si-Tu-Savais/Si-Tu-Savais.ly', 'Si Tu Savais', 'Django Reinhardt'),
    ('Jazz/As Time Goes By/As-Time-Goes-By.ly', 'As Time Goes By', 'Herman Hupfeld'),
    ('Jazz/Misty/Misty Grap.ly', 'Misty', 'Erroll Garner'),
]

def extract_metadata(ly_file):
    """Extract title and composer from .ly file."""
    try:
        with open(ly_file, 'r', encoding='utf-8') as f:
            content = f.read()

        # Find \header block
        header_match = re.search(r'\\header\s*\{([^}]*(?:\{[^}]*\}[^}]*)*)\}', content, re.DOTALL)
        if not header_match:
            return None, None

        header_block = header_match.group(1)

        # Extract title
        title_match = re.search(r'title\s*=\s*(?:\\markup\s*)?["\']?([^"\'\n{]+)["\']?', header_block)
        if title_match:
            title = title_match.group(1).strip()
        else:
            # Try with markup
            title_match = re.search(r'title\s*=\s*\\markup.*?"([^"]*)"', header_block)
            title = title_match.group(1).strip() if title_match else 'NO TITLE'

        # Extract composer
        composer_match = re.search(r'composer\s*=\s*["\']?([^"\'\n]+)["\']?', header_block)
        composer = composer_match.group(1).strip() if composer_match else 'NO COMPOSER'

        # Clean up markup commands
        title = re.sub(r'\\[a-z]+\s*', '', title)
        composer = re.sub(r'\\[a-z]+\s*', '', composer)

        return title, composer
    except Exception as e:
        return f'ERROR: {e}', 'ERROR'

def check_preview(ly_file):
    """Check if preview exists."""
    ly_path = Path(ly_file)
    preview_path = ly_path.with_name(f"{ly_path.stem}-preview.png")
    return preview_path.exists()

def main():
    root_dir = Path(__file__).resolve().parent.parent
    os.chdir(root_dir)

    print("=" * 100)
    print("VERIFICATION OF 20 FIXED FILES")
    print("=" * 100)
    print()
    print(f"{'File':<50s} {'Preview':<10s} {'Title Match':<15s} {'Composer Match':<15s}")
    print("-" * 100)

    all_good = True
    issues = []

    for file_path, expected_title, expected_composer in FILES_TO_CHECK:
        ly_file = root_dir / file_path

        if not ly_file.exists():
            print(f"{ly_file.name:<50s} {'MISSING':<10s} {'N/A':<15s} {'N/A':<15s}")
            all_good = False
            issues.append(f"File not found: {file_path}")
            continue

        # Check preview
        has_preview = check_preview(ly_file)
        preview_status = '✅' if has_preview else '❌'

        # Check metadata
        actual_title, actual_composer = extract_metadata(ly_file)

        # Normalize for comparison
        title_match = expected_title.lower() in actual_title.lower() or actual_title.lower() in expected_title.lower()
        composer_match = expected_composer.lower() in actual_composer.lower() or actual_composer.lower() in expected_composer.lower()

        title_status = '✅' if title_match else '❌'
        composer_status = '✅' if composer_match else '❌'

        filename = ly_file.name
        if len(filename) > 47:
            filename = filename[:44] + '...'

        print(f"{filename:<50s} {preview_status:<10s} {title_status:<15s} {composer_status:<15s}")

        if not has_preview:
            all_good = False
            issues.append(f"Missing preview: {file_path}")

        if not title_match:
            all_good = False
            issues.append(f"Title mismatch in {file_path}: expected '{expected_title}', got '{actual_title}'")

        if not composer_match:
            all_good = False
            issues.append(f"Composer mismatch in {file_path}: expected '{expected_composer}', got '{actual_composer}'")

    print("-" * 100)
    print()

    if all_good:
        print("✅ ALL 20 FILES VERIFIED SUCCESSFULLY!")
        print()
        print("✓ All files have previews")
        print("✓ All titles match")
        print("✓ All composers match")
    else:
        print("⚠️  ISSUES FOUND:")
        print()
        for issue in issues:
            print(f"  • {issue}")

    print()
    print("=" * 100)

if __name__ == "__main__":
    main()
