#!/usr/bin/env python3
"""Analyze the repository structure and identify issues"""

from pathlib import Path
from collections import defaultdict
import re

repo_root = Path("/Users/marc.mouries/projects/Sheet-Music")

# Folders to exclude from analysis
EXCLUDE_DIRS = {'.git', '.claude', 'stylesheets', 'Lilypond_How-to', 'node_modules', '__pycache__'}

def analyze_structure():
    """Analyze the folder structure and identify issues"""

    issues = {
        'loose_files_in_root': [],
        'folders_with_underscore': [],
        'single_file_folders': [],
        'folders_without_ly_files': [],
        'top_level_summary': defaultdict(int)
    }

    # Check for loose files in root
    for item in repo_root.iterdir():
        if item.is_file() and item.suffix in ['.ly', '.pdf', '.midi', '.mid', '.abc']:
            issues['loose_files_in_root'].append(item.name)

    # Analyze folder structure
    for top_dir in repo_root.iterdir():
        if not top_dir.is_dir() or top_dir.name in EXCLUDE_DIRS:
            continue

        # Count files by type
        ly_files = list(top_dir.rglob("*.ly"))
        issues['top_level_summary'][top_dir.name] = len(ly_files)

        # Check for underscore prefixes (usually means temporary/WIP)
        if top_dir.name.startswith('_'):
            issues['folders_with_underscore'].append(top_dir.name)

        # Check for folders with no .ly files
        if len(ly_files) == 0:
            issues['folders_without_ly_files'].append(top_dir.name)

        # Check for folders with only 1 file (might need reorganization)
        for subdir in top_dir.iterdir():
            if subdir.is_dir():
                subdir_ly_files = list(subdir.rglob("*.ly"))
                if len(subdir_ly_files) == 1:
                    issues['single_file_folders'].append(str(subdir.relative_to(repo_root)))

    return issues

def print_report(issues):
    """Print a formatted report"""

    print("=" * 80)
    print("MARC'S SHEET MUSIC COLLECTION - STRUCTURE ANALYSIS")
    print("=" * 80)

    print("\n📊 TOP-LEVEL FOLDER SUMMARY:")
    print("-" * 80)
    for folder, count in sorted(issues['top_level_summary'].items(), key=lambda x: -x[1]):
        print(f"  {folder:50s} {count:4d} files")

    print(f"\n\n🔴 ISSUES FOUND:\n")

    if issues['loose_files_in_root']:
        print(f"1. LOOSE FILES IN ROOT ({len(issues['loose_files_in_root'])} files):")
        print("   These files should be moved to appropriate folders:")
        for f in sorted(issues['loose_files_in_root']):
            print(f"   - {f}")

    if issues['folders_with_underscore']:
        print(f"\n2. FOLDERS WITH UNDERSCORE PREFIX ({len(issues['folders_with_underscore'])}):")
        print("   Usually indicates WIP/temporary - should be reviewed:")
        for f in sorted(issues['folders_with_underscore']):
            print(f"   - {f}")

    if issues['folders_without_ly_files']:
        print(f"\n3. FOLDERS WITHOUT .LY FILES ({len(issues['folders_without_ly_files'])}):")
        print("   These folders contain no LilyPond files:")
        for f in sorted(issues['folders_without_ly_files']):
            print(f"   - {f}")

    if issues['single_file_folders']:
        print(f"\n4. FOLDERS WITH ONLY 1 FILE ({len(issues['single_file_folders'])}):")
        print("   These might benefit from consolidation:")
        for f in sorted(issues['single_file_folders'])[:20]:  # Show first 20
            print(f"   - {f}")
        if len(issues['single_file_folders']) > 20:
            print(f"   ... and {len(issues['single_file_folders']) - 20} more")

if __name__ == "__main__":
    issues = analyze_structure()
    print_report(issues)
