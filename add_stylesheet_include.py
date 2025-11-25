#!/usr/bin/env python3
"""Add stylesheet include to folk tunes in 4/4 or 2/2 time."""

import os
import re
from pathlib import Path

files = [
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Canada/L-Air-Mignonne/L-Air-Mignonne.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_French/Jean Petit qui danse/Jean Petit qui Danse.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Hungary/Basso/the Basso Gypsy - Duet - Preview.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Hungary/Basso/the Basso Gypsy - Duet.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Hungary/La Rose Jaune/La Rose Jaune.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Hungary/Mori Shej/Mori+Shej_2.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Hungary/Mori Shej/Mori+Shej.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Ireland/DrGilbert/drGilbert_1-1.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Ireland/DrGilbert/drGilbert_1.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Ireland/DrGilbert/drGilbert_2_converted.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Ireland/Molly-Ban/Molly-Ban.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Ireland/The Musical Priest/The Musical Priest.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Ireland/Trip to Pakistan/tripToPakistan.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Ireland/Trip to Pakistan/tripToPakistan2.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Ireland/Whiskey in the Jar/Whiskey in the Jar.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Jewish/Chosen-Kalle-Mazel-Tov/Chosen_Kalle_Mazel_Tov.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Jewish/Erev-shel-Shoshanim/Erev-shel-Shoshanim.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Jewish/Hevenu_Shalom_Aleichem/hevenu_shalom_aleichem.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Jewish/Im-Hashem-Lo-Yivneh-Bayis/Im-Hashem-Lo-Yivneh-Bayis.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Jewish/Papirosen/Papirosen.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Romania/Hora Martisorului/Hora-martisorului.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Russia/Korobeiniki_Tetris/korobeiniki.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Scotland/Auld-Lang-Syne/Auld-Lang-Syne_(in D).ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_Scotland/Auld-Lang-Syne/Auld-Lang-Syne_Jig.ly",
    "/Users/marc.mouries/projects/Sheet-Music/Folk_USA/Jerusalem Ridge/Jerusulam Ridge, Kenny Baker.ly",
]

base_dir = Path("/Users/marc.mouries/projects/Sheet-Music")
stylesheet_path = base_dir / "stylesheets" / "stylesheet_fiddle.ly"

modified_count = 0
skipped_count = 0

for file_path in files:
    file_path = Path(file_path)

    # Calculate relative path from file to stylesheet
    relative_path = os.path.relpath(stylesheet_path, file_path.parent)
    include_line = f'\\include "{relative_path}"\n'

    # Read the file
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Check if already has the include
    if 'stylesheet_fiddle.ly' in content:
        print(f"SKIP: {file_path.relative_to(base_dir)} - already has stylesheet include")
        skipped_count += 1
        continue

    # Find \version line and add include after it
    version_match = re.search(r'(\\version\s+"[^"]+"\s*\n)', content)

    if version_match:
        # Insert include after version line
        new_content = content[:version_match.end()] + include_line + content[version_match.end():]

        # Write back
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(new_content)

        print(f"MODIFIED: {file_path.relative_to(base_dir)}")
        print(f"  Added: {include_line.strip()}")
        modified_count += 1
    else:
        print(f"WARNING: {file_path.relative_to(base_dir)} - no \\version line found")
        skipped_count += 1

print(f"\n✅ Modified: {modified_count} files")
print(f"⏭️  Skipped: {skipped_count} files")
