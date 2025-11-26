#!/usr/bin/env python3
"""
Rename PDFs to match their corresponding .ly files
"""
from pathlib import Path
import shutil

repo_root = Path('/Users/marc.mouries/projects/Sheet-Music')

# Directories to exclude
EXCLUDE_DIRS = {'.git', 'node_modules', '__pycache__', 'Lilypond_How-to', 'Harmonica'}

def find_best_matching_pdf(ly_file):
    """Find the PDF that best matches the .ly file"""
    pdfs_in_dir = list(ly_file.parent.glob('*.pdf'))

    if not pdfs_in_dir:
        return None

    ly_stem = ly_file.stem.lower().replace('-', '').replace('_', '').replace(' ', '')

    # Try to find exact match first
    for pdf in pdfs_in_dir:
        pdf_stem = pdf.stem.lower().replace('-', '').replace('_', '').replace(' ', '')
        if pdf_stem == ly_stem:
            return pdf

    # Try to find close match
    for pdf in pdfs_in_dir:
        pdf_stem = pdf.stem.lower().replace('-', '').replace('_', '').replace(' ', '')
        if ly_stem in pdf_stem or pdf_stem in ly_stem:
            return pdf

    # If only one PDF, use that
    if len(pdfs_in_dir) == 1:
        return pdfs_in_dir[0]

    # Check for common patterns
    ly_name_parts = ly_file.stem.lower().split()
    for pdf in pdfs_in_dir:
        pdf_parts = pdf.stem.lower().split()
        # If they share significant words
        common_words = set(ly_name_parts) & set(pdf_parts)
        if len(common_words) >= 2:
            return pdf

    return None

print("=" * 80)
print("RENAMING PDFs TO MATCH .LY FILES")
print("=" * 80)

renamed = 0
skipped = 0
not_found = 0

for ly_file in sorted(repo_root.rglob('*.ly')):
    # Skip excluded directories
    if any(excluded in ly_file.parts for excluded in EXCLUDE_DIRS):
        continue

    expected_pdf = ly_file.with_suffix('.pdf')

    # Skip if PDF already has correct name
    if expected_pdf.exists():
        continue

    # Look for PDFs in the same directory
    pdfs_in_dir = list(ly_file.parent.glob('*.pdf'))
    if not pdfs_in_dir:
        continue

    # Find best matching PDF
    best_match = find_best_matching_pdf(ly_file)

    if not best_match:
        print(f"\n❓ NO CLEAR MATCH: {ly_file.relative_to(repo_root)}")
        print(f"   Available PDFs:")
        for pdf in pdfs_in_dir[:3]:
            print(f"     - {pdf.name}")
        not_found += 1
        continue

    # Skip if it's the same file (already named correctly)
    if best_match == expected_pdf:
        continue

    # Skip if PDF with expected name already exists (different file)
    if expected_pdf.exists():
        print(f"\n⚠️  CONFLICT: {ly_file.relative_to(repo_root)}")
        print(f"   Target PDF already exists: {expected_pdf.name}")
        skipped += 1
        continue

    # Rename the PDF
    try:
        print(f"\n✅ RENAMING:")
        print(f"   LY:  {ly_file.relative_to(repo_root)}")
        print(f"   OLD: {best_match.name}")
        print(f"   NEW: {expected_pdf.name}")

        shutil.move(str(best_match), str(expected_pdf))
        renamed += 1
    except Exception as e:
        print(f"   ❌ ERROR: {e}")
        skipped += 1

print("\n" + "=" * 80)
print(f"Summary: {renamed} renamed, {skipped} skipped, {not_found} no clear match")
print("=" * 80)
