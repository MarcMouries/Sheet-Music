#!/usr/bin/env python3
"""
Add country metadata to LilyPond files by researching the tune's origin.
This script reads each tune's title and composer, determines the country of origin,
and adds a 'country' field to the header block.
"""

import os
import re
from pathlib import Path
from typing import Optional, Tuple

# Exclude directories
EXCLUDE_DIRS = {'.git', 'stylesheets', 'common', 'lilypong_how-to', 'Lilypond_How-to',
                'node_modules', '__pycache__', 'Scales', 'Practice'}

# Component files to exclude
EXCLUDE_FILENAMES = {'book.ly', 'book-1.ly', 'book-2.ly', 'guitar1.ly', 'guitar2.ly',
                     'guitar3.ly', 'guitar4.ly', 'dynamicsa.ly', 'dynamicsb.ly',
                     'dynamicsc.ly', 'blank.ly', 'blank1.ly', 'copyright.ly',
                     'spacing.ly', 'gymnopedie-2.ly', 'gymnopedie-3.ly',
                     'make-score-preview-lilypond-example.ly'}

# Known composers and their countries
COMPOSER_COUNTRIES = {
    # Classical composers
    'bach': 'Germany',
    'johann sebastian bach': 'Germany',
    'beethoven': 'Germany',
    'brahms': 'Germany',
    'johannes brahms': 'Germany',
    'mozart': 'Austria',
    'w. a. mozart': 'Austria',
    'wolfgang amadeus mozart': 'Austria',
    'schubert': 'Austria',
    'haydn': 'Austria',
    'strauss': 'Austria',
    'vivaldi': 'Italy',
    'paganini': 'Italy',
    'niccolò paganini': 'Italy',
    'puccini': 'Italy',
    'rossini': 'Italy',
    'verdi': 'Italy',
    'boccherini': 'Italy',
    'chopin': 'Poland',
    'debussy': 'France',
    'ravel': 'France',
    'fauré': 'France',
    'saint-saëns': 'France',
    'berlioz': 'France',
    'satie': 'France',
    'erik satie': 'France',
    'massenet': 'France',
    'bizet': 'France',
    'tchaikovsky': 'Russia',
    'rachmaninoff': 'Russia',
    'shostakovich': 'Russia',
    'prokofiev': 'Russia',
    'rimsky-korsakov': 'Russia',
    'mussorgsky': 'Russia',
    'dvořák': 'Czech Republic',
    'smetana': 'Czech Republic',
    'grieg': 'Norway',
    'sibelius': 'Finland',
    'elgar': 'England',
    'vaughan williams': 'England',
    'holst': 'England',
    'britten': 'England',
    'purcell': 'England',
    'handel': 'England',
    'john eccles': 'England',
    'albéniz': 'Spain',
    'de falla': 'Spain',
    'granados': 'Spain',
    'villa-lobos': 'Brazil',
    'paradis': 'Austria',
    'maria-theresia von paradis': 'Austria',
    'mel bonis': 'France',

    # Jazz/Gypsy Jazz
    'django reinhardt': 'France',
    'stéphane grappelli': 'France',
    'stephane grappelli': 'France',
    'stéphane wrembel': 'France',
    'stephane wrembel': 'France',
    'erroll garner': 'USA',
    'herman hupfeld': 'USA',
    'quincy jones': 'USA',
    'duke ellington': 'USA',
    'charlie parker': 'USA',
    'john coltrane': 'USA',

    # Folk/Traditional (when specified)
    'traditional irish': 'Ireland',
    'traditional german': 'Germany',
    'traditional french': 'France',
    'traditional': None,  # Need more context
    'tommy potts': 'Ireland',
    'reg bouvette': 'Canada',

    # American composers
    'gershwin': 'USA',
    'copland': 'USA',
    'barber': 'USA',
    'bernstein': 'USA',
    'john stafford smith': 'England',  # Star Spangled Banner composer
    'jimmie davis': 'USA',
    'charles mitchell': 'USA',
    'bill monroe': 'USA',
    'jay ungar': 'USA',
    'traditional american': 'USA',
    'traditional french': 'France',
    'traditional hungarian': 'Hungary',
    'traditional english': 'England',
    'simon riopel': 'Canada',

    # Soundtrack composers
    'john williams': 'USA',
    'marin marais': 'France',
    'shigeru umebayashi': 'Japan',
    'fiorenzo carpi': 'Italy',
    'novi novog': 'France',

    # Pop/Modern
    'loreena mckennitt': 'Canada',
    'charles aznavour': 'France',
    'leroy kirkland': 'USA',
    'pearl woods': 'USA',
    'steve kroeger': 'USA',
    'skye holland': 'USA',
    'hubert giraud': 'France',
    'patty hill': 'USA',
    'mildred j. hill': 'USA',
    'osvaldo farres': 'Cuba',

    # Classical
    'felix mendelssohn': 'Germany',
    'paul dukas': 'France',
    'grigoraș dinicu': 'Romania',
    'józsef balogh': 'Hungary',
    'john dowland': 'England',
    'johan halvorsen': 'Norway',
    'matteo carcassi': 'Italy',
    'g. p. reverberi': 'Italy',
    'd. farina': 'Italy',
    'toshifumi hinata': 'Japan',

    # More Jazz/Pop
    'jule styne': 'England',  # Born UK, moved to USA
    'jimmy mchugh': 'USA',
    'lukasz kapuscinski': 'Poland',
}

# Known tune titles and their countries (for traditional tunes)
TUNE_COUNTRIES = {
    # Irish tunes
    "the butterfly": "Ireland",
    "the trip to sligo": "Ireland",
    "up sligo": "Ireland",
    "gary owen": "Ireland",
    "devil's dream": "USA",  # Often thought Irish but actually American

    # American tunes
    "star spangled banner": "USA",
    "you are my sunshine": "USA",
    "ashokan farewell": "USA",
    "jerusalem ridge": "USA",

    # German tunes
    "muss i denn": "Germany",

    # English tunes
    "greensleeves": "England",

    # Christmas (international, mark as such)
    "silent night": "Austria",
    "o holy night": "France",
    "jingle bells": "USA",
    "the first noel": "England",  # English carol, originated in Cornwall
    "the first noël": "England",
    "let it snow, let it snow, let it snow!": "USA",
}

def extract_header_info(ly_file: Path) -> Tuple[Optional[str], Optional[str], Optional[str]]:
    """Extract title, composer, and existing country from LilyPond file."""
    try:
        with open(ly_file, 'r', encoding='utf-8') as f:
            content = f.read()

        # Find header block
        header_match = re.search(r'\\header\s*\{([^}]*(?:\{[^}]*\}[^}]*)*)\}', content, re.DOTALL)
        if not header_match:
            return None, None, None

        header_block = header_match.group(1)

        # Extract title
        title_match = re.search(r'title\s*=\s*["\']([^"\']+)["\']', header_block)
        title = title_match.group(1).strip() if title_match else None

        # Extract composer
        composer_match = re.search(r'composer\s*=\s*["\']([^"\']+)["\']', header_block)
        composer = composer_match.group(1).strip() if composer_match else None

        # Check if country already exists
        country_match = re.search(r'country\s*=\s*["\']([^"\']+)["\']', header_block)
        country = country_match.group(1).strip() if country_match else None

        return title, composer, country

    except Exception as e:
        print(f"Error reading {ly_file}: {e}")
        return None, None, None

def determine_country(title: str, composer: str, file_path: Path) -> Optional[str]:
    """Determine the country of origin for a tune."""

    if not title:
        return None

    # 1. Check known tune titles
    title_lower = title.lower().strip()
    if title_lower in TUNE_COUNTRIES:
        return TUNE_COUNTRIES[title_lower]

    # 2. Check composer
    if composer:
        composer_lower = composer.lower().strip()

        # Direct match
        if composer_lower in COMPOSER_COUNTRIES:
            country = COMPOSER_COUNTRIES[composer_lower]
            if country:
                return country

        # Partial match (e.g., "Bach" in "J.S. Bach")
        for known_composer, country in COMPOSER_COUNTRIES.items():
            if known_composer in composer_lower:
                if country:
                    return country

    # 3. Infer from folder structure as fallback
    parts = file_path.parts

    for part in parts:
        if part.startswith('Folk_'):
            country = part.replace('Folk_', '')
            # Map folder names to proper country names
            country_map = {
                'USA': 'USA',
                'Canada': 'Canada',
                'French': 'France',
                'Germany': 'Germany',
                'Ireland': 'Ireland',
                'Scotland': 'Scotland',
                'England': 'England',
                'Italy': 'Italy',
                'Russia': 'Russia',
                'Hungary': 'Hungary',
                'Romania': 'Romania',
                'Finland': 'Finland',
                'Jewish': 'Jewish',
            }
            return country_map.get(country, country)

        # Other folder-based hints
        if 'Celtic' in part:
            return 'Ireland'  # Default Celtic to Ireland
        if 'Gypsy-Jazz' in part or 'Gypsy' in part:
            return 'France'  # Gypsy jazz is primarily French

    # 4. Classical music - try to infer from folder location
    if 'Classical' in parts:
        # Most classical in this collection is European
        return None  # Will be determined by composer

    return None

def scan_files():
    """Scan all .ly files and report what countries can be determined."""
    root_dir = Path(__file__).resolve().parent.parent
    os.chdir(root_dir)

    results = {
        'has_country': [],
        'can_determine': [],
        'cannot_determine': [],
    }

    for ly_file in root_dir.rglob('*.ly'):
        # Skip excluded directories
        if any(excluded in ly_file.parts for excluded in EXCLUDE_DIRS):
            continue

        # Skip component files
        if ly_file.name in EXCLUDE_FILENAMES:
            continue

        title, composer, existing_country = extract_header_info(ly_file)

        if not title:
            continue

        if existing_country:
            results['has_country'].append((ly_file, title, composer, existing_country))
        else:
            determined_country = determine_country(title, composer, ly_file)
            if determined_country:
                results['can_determine'].append((ly_file, title, composer, determined_country))
            else:
                results['cannot_determine'].append((ly_file, title, composer))

    return results

def add_country_to_file(ly_file: Path, country: str, dry_run: bool = True) -> bool:
    """Add country field to a LilyPond file's header block."""
    try:
        with open(ly_file, 'r', encoding='utf-8') as f:
            content = f.read()

        # Find header block
        header_match = re.search(r'(\\header\s*\{)([^}]*(?:\{[^}]*\}[^}]*)*)\}', content, re.DOTALL)
        if not header_match:
            print(f"  WARNING: No header block found in {ly_file.name}")
            return False

        header_start = header_match.group(1)
        header_content = header_match.group(2)

        # Check if country already exists
        if re.search(r'country\s*=', header_content):
            return False  # Already has country

        # Find the best place to insert country (after composer, before style/tagline)
        lines = header_content.split('\n')
        insert_index = None

        for i, line in enumerate(lines):
            if 'composer' in line:
                insert_index = i + 1
                break

        if insert_index is None:
            # No composer found, insert after title
            for i, line in enumerate(lines):
                if 'title' in line:
                    insert_index = i + 1
                    break

        if insert_index is None:
            # Just insert at the beginning
            insert_index = 1

        # Insert the country line
        lines.insert(insert_index, f'  country = "{country}"')
        new_header_content = '\n'.join(lines)

        # Replace in original content
        new_content = content.replace(header_match.group(0),
                                      f"{header_start}{new_header_content}}}")

        if not dry_run:
            with open(ly_file, 'w', encoding='utf-8') as f:
                f.write(new_content)

        return True

    except Exception as e:
        print(f"  ERROR: Failed to update {ly_file.name}: {e}")
        return False

def main():
    import argparse

    parser = argparse.ArgumentParser(description='Add country metadata to LilyPond files')
    parser.add_argument('--apply', action='store_true',
                       help='Actually add country fields to files (default is dry-run)')
    parser.add_argument('--verbose', '-v', action='store_true',
                       help='Show detailed progress')
    args = parser.parse_args()

    print("=" * 80)
    print("COUNTRY METADATA ANALYSIS")
    print("=" * 80)
    print()

    if args.apply:
        print("⚠️  APPLY MODE - Will modify files!")
    else:
        print("🔍 DRY RUN MODE - No files will be modified")
    print()

    results = scan_files()

    print(f"📊 Files already with country: {len(results['has_country'])}")
    print(f"✅ Files we can determine: {len(results['can_determine'])}")
    print(f"❓ Files needing manual research: {len(results['cannot_determine'])}")
    print()

    if results['can_determine']:
        print("=" * 80)
        print("CAN DETERMINE (showing first 20):")
        print("=" * 80)
        for ly_file, title, composer, country in results['can_determine'][:20]:
            rel_path = ly_file.relative_to(Path.cwd())
            print(f"{title:40s} | {composer or 'N/A':25s} | {country}")

        if len(results['can_determine']) > 20:
            print(f"... and {len(results['can_determine']) - 20} more")
        print()

    if results['cannot_determine']:
        print("=" * 80)
        print("CANNOT DETERMINE (need manual research):")
        print("=" * 80)
        for ly_file, title, composer in results['cannot_determine'][:30]:
            rel_path = ly_file.relative_to(Path.cwd())
            print(f"{title:40s} | {composer or 'N/A':25s} | {rel_path}")

        if len(results['cannot_determine']) > 30:
            print(f"... and {len(results['cannot_determine']) - 30} more")
        print()

    if args.apply and results['can_determine']:
        print("=" * 80)
        print("APPLYING CHANGES...")
        print("=" * 80)
        success_count = 0
        for ly_file, title, composer, country in results['can_determine']:
            if args.verbose:
                print(f"  Adding {country} to {ly_file.name}...")
            if add_country_to_file(ly_file, country, dry_run=False):
                success_count += 1

        print(f"\n✅ Successfully added country to {success_count} files!")
    elif not args.apply:
        print("=" * 80)
        print("NEXT STEPS:")
        print("=" * 80)
        print("1. Review the determinations above")
        print("2. Add any missing composers/tunes to the dictionaries in this script")
        print("3. Run with --apply to add country fields to files")
        print()

if __name__ == "__main__":
    main()
