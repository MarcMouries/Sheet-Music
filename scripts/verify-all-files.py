#!/usr/bin/env python3
"""
Verify that all .ly files have:
1. Preview image (-preview.png)
2. MIDI file (.midi)
3. PDF file (.pdf)
"""

import os
from pathlib import Path

def main():
    root_dir = Path(__file__).resolve().parent.parent
    os.chdir(root_dir)

    # Skip these directories
    skip_dirs = {
        'WIP', 'Practice', 'lilypong_how-to', 'Lilypond_How-to',
        'Learn Violin with Famous Themes', '8-Step_Warm-Up_Plan',
        'Harmonica', 'Marc\'s Practice Points', 'common', 'stylesheets'
    }

    # Find all .ly files
    ly_files = []
    for ly_file in root_dir.rglob('*.ly'):
        # Skip if in excluded directory
        if any(skip_dir in ly_file.parts for skip_dir in skip_dirs):
            continue
        # Skip if filename starts with underscore (preview wrappers)
        if ly_file.name.startswith('_'):
            continue
        # Skip music.ily files
        if ly_file.name.endswith('_music.ily'):
            continue
        ly_files.append(ly_file)

    print("=" * 120)
    print(f"VERIFICATION OF ALL SHEET MUSIC FILES ({len(ly_files)} files)")
    print("=" * 120)
    print()

    # Check for missing files
    missing_preview = []
    missing_midi = []
    missing_pdf = []

    for ly_file in sorted(ly_files):
        rel_path = ly_file.relative_to(root_dir)

        # Check for preview
        preview_path = ly_file.with_name(f"{ly_file.stem}-preview.png")
        if not preview_path.exists():
            missing_preview.append(rel_path)

        # Check for MIDI
        midi_path = ly_file.with_suffix('.midi')
        if not midi_path.exists():
            missing_midi.append(rel_path)

        # Check for PDF
        pdf_path = ly_file.with_suffix('.pdf')
        if not pdf_path.exists():
            missing_pdf.append(rel_path)

    # Print results
    if missing_preview:
        print(f"❌ MISSING PREVIEWS ({len(missing_preview)} files):")
        print("-" * 120)
        for path in missing_preview:
            print(f"  • {path}")
        print()
    else:
        print("✅ All files have preview images!")
        print()

    if missing_midi:
        print(f"❌ MISSING MIDI FILES ({len(missing_midi)} files):")
        print("-" * 120)
        for path in missing_midi:
            print(f"  • {path}")
        print()
    else:
        print("✅ All files have MIDI files!")
        print()

    if missing_pdf:
        print(f"❌ MISSING PDF FILES ({len(missing_pdf)} files):")
        print("-" * 120)
        for path in missing_pdf:
            print(f"  • {path}")
        print()
    else:
        print("✅ All files have PDF files!")
        print()

    # Summary
    print("=" * 120)
    print(f"SUMMARY: {len(ly_files)} files checked")
    print(f"  • Missing previews: {len(missing_preview)}")
    print(f"  • Missing MIDI: {len(missing_midi)}")
    print(f"  • Missing PDF: {len(missing_pdf)}")

    if not (missing_preview or missing_midi or missing_pdf):
        print("\n✅ ALL FILES COMPLETE!")

    print("=" * 120)

if __name__ == "__main__":
    main()
