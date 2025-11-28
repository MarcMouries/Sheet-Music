#!/usr/bin/env python3
"""
Investigate missing previews for specific files mentioned by user.
"""

import os
import re
from pathlib import Path

# Files to investigate (patterns)
FILES_TO_CHECK = [
    "Classical/Bach_Badinerie/Bach-Badinerie.ly",
    "Classical/Paganini_Io-ti-penso-amore/Io-Ti-Penso-Amore.ly",
    "Classical/Mozart_Rondo_Alla_Turca/KV331_3_RondoAllaTurca.ly",
    "Classical/Paradis - Sicilienne/Paradis-Sicilienne.ly",
    "Classical/Mel Bonis - Suite en trio, Op.59/Mel-BONIS-Serenade.ly",
    "Classical/The Mad Lover (Eccles, John)/The Mad Lover (Eccles, John).ly",
    "Classical/Brahms_Berceuse/Brahms-Berceuse.ly",
    "Folk_Canada/Teardrop Waltz/Teardrop Waltz_Marc.ly",
    "Folk_USA/Devils Dream/Devil's Dream.ly",
    "Folk_USA/The-Star-Spangled-Banner/The-Star Spangled Banner.ly",
    "Folk_USA/You_are_my_Sunshine/You_are_my_Sunshine.ly",
    "Gypsy-Jazz/Bistro-Fada/Bistro_Fada.xml.ly",
    "Gypsy-Jazz/Blues-en-Mineur/Blues-en-Mineur.ly",
    "Gypsy-Jazz/Daphné/Daphne - Grappelli+Taylor.ly",
    "Gypsy-Jazz/Minor-Swing/Minor Swing - van Hemert.ly",
    "Gypsy-Jazz/Si-Tu-Savais/Si-Tu-Savais.ly",
    "Jazz/As Time Goes By/As-Time-Goes-By.ly",
    "Jazz/Misty/Misty Grap.ly",
    "Folk_Ireland/The Trip To Sligo (Jig)/triptosligo-3.ly",
    "Folk_Ireland/The Trip To Sligo (Jig)/The Trip To Sligo (Jig).ly",
]

def extract_header(ly_file):
    """Extract header metadata from .ly file."""
    try:
        with open(ly_file, 'r', encoding='utf-8') as f:
            content = f.read()

        # Find \header block
        header_match = re.search(r'\\header\s*\{([^}]*)\}', content, re.DOTALL)
        if not header_match:
            return None

        header_block = header_match.group(1)

        # Extract fields
        title = re.search(r'title\s*=\s*["\']?([^"\'\n]*)["\']?', header_block)
        composer = re.search(r'composer\s*=\s*["\']?([^"\'\n]*)["\']?', header_block)
        style = re.search(r'style\s*=\s*["\']?([^"\'\n]*)["\']?', header_block)

        # Handle markup
        if title and '\\markup' in title.group(0):
            title_match = re.search(r'title\s*=\s*\\markup.*?"([^"]*)"', header_block)
            if title_match:
                title = title_match

        return {
            'title': title.group(1).strip() if title else 'NO TITLE',
            'composer': composer.group(1).strip() if composer else 'NO COMPOSER',
            'style': style.group(1).strip() if style else 'NO STYLE',
        }
    except Exception as e:
        return {'error': str(e)}

def check_file_status(ly_file):
    """Check status of a single file."""
    ly_path = Path(ly_file)

    if not ly_path.exists():
        return {'exists': False, 'status': 'FILE NOT FOUND'}

    # Get paths
    pdf_path = ly_path.with_suffix('.pdf')
    preview_path = ly_path.with_name(f"{ly_path.stem}-preview.png")

    # Extract metadata
    header = extract_header(ly_path)

    return {
        'exists': True,
        'path': str(ly_path),
        'header': header,
        'pdf_exists': pdf_path.exists(),
        'preview_exists': preview_path.exists(),
        'pdf_path': str(pdf_path) if pdf_path.exists() else 'NO PDF',
        'preview_path': str(preview_path) if preview_path.exists() else 'NO PREVIEW',
    }

def main():
    root_dir = Path(__file__).resolve().parent.parent

    print("=" * 80)
    print("MISSING PREVIEWS INVESTIGATION")
    print("=" * 80)
    print()

    # Categories
    has_preview = []
    no_preview_no_pdf = []
    no_preview_has_pdf = []

    for rel_path in FILES_TO_CHECK:
        full_path = root_dir / rel_path
        status = check_file_status(full_path)

        if not status['exists']:
            print(f"⚠️  NOT FOUND: {rel_path}")
            continue

        # Categorize
        if status['preview_exists']:
            has_preview.append(status)
        elif not status['pdf_exists']:
            no_preview_no_pdf.append(status)
        else:
            no_preview_has_pdf.append(status)

    # Print results
    print("\n" + "=" * 80)
    print("FILES WITH PREVIEWS (User thought they didn't have them)")
    print("=" * 80)
    if has_preview:
        for s in has_preview:
            print(f"\n✓ {Path(s['path']).relative_to(root_dir)}")
            print(f"  Title: {s['header']['title']}")
            print(f"  Composer: {s['header']['composer']}")
            print(f"  Preview: {Path(s['preview_path']).name}")
    else:
        print("None")

    print("\n" + "=" * 80)
    print("FILES WITHOUT PREVIEWS - NO PDF EXISTS")
    print("=" * 80)
    if no_preview_no_pdf:
        for s in no_preview_no_pdf:
            print(f"\n⊘ {Path(s['path']).relative_to(root_dir)}")
            print(f"  Title: {s['header']['title']}")
            print(f"  Composer: {s['header']['composer']}")
            print(f"  Reason: PDF does not exist - cannot generate preview")
    else:
        print("None")

    print("\n" + "=" * 80)
    print("FILES WITHOUT PREVIEWS - HAS PDF (COMPILATION FAILED)")
    print("=" * 80)
    if no_preview_has_pdf:
        for s in no_preview_has_pdf:
            print(f"\n✗ {Path(s['path']).relative_to(root_dir)}")
            print(f"  Title: {s['header']['title']}")
            print(f"  Composer: {s['header']['composer']}")
            print(f"  PDF: EXISTS")
            print(f"  Reason: Preview generation failed during batch process")
    else:
        print("None")

    print("\n" + "=" * 80)
    print("SUMMARY")
    print("=" * 80)
    print(f"Files with previews:        {len(has_preview)}")
    print(f"Files without PDF:          {len(no_preview_no_pdf)}")
    print(f"Files with compilation errors: {len(no_preview_has_pdf)}")
    print("=" * 80)

if __name__ == "__main__":
    main()
