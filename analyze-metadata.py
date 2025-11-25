#!/usr/bin/env python3
"""
Analyze sheet music metadata and identify issues
"""
import re
from pathlib import Path
from collections import defaultdict

REPO_ROOT = Path(__file__).parent
EXCLUDE_DIRS = {'.git', 'stylesheets', 'Lilypond_How-to', 'node_modules', '__pycache__', 'Practice', 'Scales'}

def parse_lilypond_header(ly_file):
    """Extract metadata from LilyPond header"""
    metadata = {
        'title': ly_file.stem.replace('_', ' ').replace('-', ' '),
        'composer': '',
        'meter': '',
        'key': '',
        'subtitle': '',
        'file': str(ly_file.relative_to(REPO_ROOT))
    }

    try:
        with open(ly_file, 'r', encoding='utf-8') as f:
            content = f.read(3000)

            # Extract header section
            header_match = re.search(r'\\header\s*\{([^}]*)\}', content, re.DOTALL)
            if header_match:
                header = header_match.group(1)

                # Extract fields
                for field in ['title', 'composer', 'meter', 'subtitle']:
                    pattern = rf'{field}\s*=\s*"([^"]*)"'
                    match = re.search(pattern, header)
                    if match:
                        metadata[field] = match.group(1)

            # Extract key signature
            key_match = re.search(r'\\key\s+([a-g][sf]*)\s+\\(major|minor|dorian|mixolydian|lydian|phrygian|locrian|aeolian)', content)
            if key_match:
                note = key_match.group(1).replace('f', '♭').replace('s', '♯')
                mode = key_match.group(2)
                metadata['key'] = f"{note} {mode}"

    except Exception as e:
        print(f"Warning: Could not parse {ly_file}: {e}")

    return metadata

def main():
    print("🔍 Analyzing metadata quality...\n")

    issues = defaultdict(list)
    version_files = defaultdict(list)

    for ly_file in REPO_ROOT.rglob('*.ly'):
        if any(excluded in ly_file.parts for excluded in EXCLUDE_DIRS):
            continue

        metadata = parse_lilypond_header(ly_file)

        # Check for missing data
        if not metadata['composer'] or metadata['composer'] in ['Trad. Celtic', '']:
            issues['missing_composer'].append(metadata)

        if not metadata['key']:
            issues['missing_key'].append(metadata)

        if not metadata['meter']:
            issues['missing_meter'].append(metadata)

        # Check for generic/poor titles
        if metadata['title'].lower() in ['untitled', 'copyright', 'blank', '', 'test']:
            issues['generic_title'].append(metadata)

        # Detect versionsfiles (v1, v2, version, -1, -2, etc.)
        if re.search(r'[-_](v\d+|\d+|version|copy|final|old|new)\.ly$', ly_file.name, re.IGNORECASE):
            folder = ly_file.parent
            version_files[folder].append(ly_file.name)

    # Print report
    print("=" * 70)
    print("                     METADATA QUALITY REPORT")
    print("=" * 70)
    print()

    print(f"📋 Total tunes analyzed: {sum(len(v) for v in issues.values()) + len([f for f in REPO_ROOT.rglob('*.ly') if not any(e in f.parts for e in EXCLUDE_DIRS)])}")
    print()

    print("❌ ISSUES FOUND:\n")

    # Missing composer
    print(f"1. Missing Composer: {len(issues['missing_composer'])} files")
    if issues['missing_composer']:
        print("   Examples:")
        for item in issues['missing_composer'][:15]:
            print(f"   - {item['title']:<40} ({item['file']})")
    print()

    # Missing key
    print(f"2. Missing Key Signature: {len(issues['missing_key'])} files")
    if issues['missing_key']:
        print("   Examples:")
        for item in issues['missing_key'][:15]:
            print(f"   - {item['title']:<40} ({item['file']})")
    print()

    # Missing meter
    print(f"3. Missing Meter/Type: {len(issues['missing_meter'])} files")
    if issues['missing_meter']:
        print("   Examples:")
        for item in issues['missing_meter'][:15]:
            print(f"   - {item['title']:<40} ({item['file']})")
    print()

    # Generic titles
    if issues['generic_title']:
        print(f"4. Generic/Invalid Titles: {len(issues['generic_title'])} files")
        for item in issues['generic_title']:
            print(f"   - {item['file']}")
    print()

    # Version files
    if version_files:
        print(f"5. Files with Multiple Versions: {len(version_files)} folders")
        print("   These folders have multiple versions:")
        for folder, files in list(version_files.items())[:20]:
            print(f"   📁 {folder.relative_to(REPO_ROOT)}")
            for f in sorted(files):
                print(f"      • {f}")
            print()

    print("=" * 70)
    print("\n💡 RECOMMENDATIONS:\n")
    print("1. Add composer names to LilyPond \\header sections")
    print("2. Add key signatures (\\key c \\major, etc.)")
    print("3. Add meter field to headers (meter = \"jig\", \"reel\", etc.)")
    print("4. Rename generic files with proper titles")
    print("5. Use consistent version naming: filename-v1.ly, filename-v2.ly")
    print()

    # Save detailed report
    report_file = REPO_ROOT / "metadata-issues.txt"
    with open(report_file, 'w') as f:
        f.write("METADATA ISSUES REPORT\n")
        f.write("=" * 70 + "\n\n")

        f.write("MISSING COMPOSER:\n")
        for item in issues['missing_composer']:
            f.write(f"{item['file']}\n")
        f.write("\n")

        f.write("MISSING KEY:\n")
        for item in issues['missing_key']:
            f.write(f"{item['file']}\n")
        f.write("\n")

        f.write("MISSING METER:\n")
        for item in issues['missing_meter']:
            f.write(f"{item['file']}\n")
        f.write("\n")

        f.write("VERSION FILES:\n")
        for folder, files in version_files.items():
            f.write(f"\n{folder.relative_to(REPO_ROOT)}\n")
            for file in files:
                f.write(f"  - {file}\n")

    print(f"📄 Detailed report saved to: {report_file}")

if __name__ == '__main__':
    main()
